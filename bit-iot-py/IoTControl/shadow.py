# AWS IoT Shadow
from AWSIoTPythonSDK.MQTTLib import AWSIoTMQTTShadowClient
import logging
import time
import argparse
import json
import led_api as led

# shadow 명령을 실행한 후 호출될 함수 정의
def updateCallback(payload, responseStatus, token):
    print("update 명령 수행결과 -----------------")
    print(payload)
    print(responseStatus)
    print(token)
    print("------------------------")

def getCallback(payload, responseStatus, token):
    print("get 명령 수행결과 -----------------")
    # AWSIoT 서버에서 받은 JSON 문자열을 객체로 변환
    dict = json.loads(payload)
    if responseStatus == "rejected" and dict['code'] == 404:
        print("shadow가 존재하지 않습니다.")

        # shadow 기본값 설정하기
        myJSONPayload = '{"state":{"desired":{"led":"on"}}}'
        myDeviceShadow.shadowUpdate(myJSONPayload, updateCallback, 5)
    else:
        print("현재 shadow의 값은 다음과 같습니다.")
        print("led:" + dict['state']['desired']['led'])
        print(token)
        if dict['state']['desired']['led'] =="on":
            led.onLed(True)
        else:
            led.onLed(False)

    print("------------------------")
    #
    # #print(message.payload)
    # # 사서함에서 받은 Json 문자열을 객체로 변환
    # dict = json.loads(message.payload.decode('UTF-8'))
    # print(dict['message'])
    # ledState = dict['led']
    # if ledState == "on":
    #     led.onLed(True)
    # else:
    #     led.onLed(False)
    # print("--------------")

host = "a1jawjb5359l39.iot.ap-northeast-2.amazonaws.com"
rootCAPath = "../root-CA.crt"
certificatePath = "../dev01.cert.pem"
privateKeyPath = "../dev01.private.key"
useWebsocket = False
clientId = "client2"


# 실행하면서 로그를 남기기 위한 설정
logger = logging.getLogger("AWSIoTPythonSDK.core")
logger.setLevel(logging.DEBUG)
streamHandler = logging.StreamHandler()
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
streamHandler.setFormatter(formatter)
logger.addHandler(streamHandler)

# AWSIoTMQTTClient 초기화
myShadowClient = AWSIoTMQTTShadowClient(clientId)
myShadowClient.configureEndpoint(host, 8883)
myShadowClient.configureCredentials(rootCAPath, privateKeyPath, certificatePath)

# AWSIoTMQTTClient 연결에 대한 제어 정보 설정
myShadowClient.configureAutoReconnectBackoffTime(1, 32, 20)
myShadowClient.configureConnectDisconnectTimeout(10)  # 10 sec
myShadowClient.configureMQTTOperationTimeout(5)  # 5 sec

# AWS IoT에 등록된 Thing과 연결
myShadowClient.connect()
print("shadow connect! \n")

# thing shadow 객체 생성
myDeviceShadow = myShadowClient.createShadowHandlerWithName("dev01", True)

myDeviceShadow.shadowGet(getCallback, 5)
