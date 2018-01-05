# AWS IoT
from AWSIoTPythonSDK.MQTTLib import AWSIoTMQTTClient
import logging
import time
import argparse
import json
import humidifier_api as humidifier
import ventilator_api as ventilator

def customCallback(client, userdata, message):
    print("메시지를 수신하였습니다. \n")
    print("사서함 이름: ")
    print(message.topic)
    print("메시지 내용: ")
    #print(message.payload)
    # 사서함에서 받은 Json 문자열을 객체로 변환
    dict = json.loads(message.payload.decode('UTF-8'))
    if dict['control'] == 'humidifier':
        if dict['value'] == 'on':
            humidifier.onHumidifier(True)
        else :
            humidifier.onHumidifier(False)
    elif dict['control'] == 'ventilator':
        if dict['value'] == 'on':
            ventilator.onVentilator(True)
        else :
            ventilator.onVentilator(False)



'''
def customCallback(client, userdata, message):
    print("메시지를 수신하였습니다. \n")
    print("사서함 이름: ")
    print(message.topic)
    print("메시지 내용: ")
    #print(message.payload)
    # 사서함에서 받은 Json 문자열을 객체로 변환
    dict = json.loads(message.payload.decode('UTF-8'))
    print(dict['message'])
    if humidifierState == dict['humidifier on'] :
        humidifier.onHumidifier(True)
    elif ventilatorState == dict['ventilator on'] :
        ventilator.onVentilator(True)
    elif ventilatorState == dict['ventilator off'] :
        ventilator.onVentilator(False)
    else :
        humidifier.onHumidifier(False)
    print("--------------")

def customCallback(client, userdata, message):
    print("메시지를 수신하였습니다. \n")
    print("사서함 이름: ")
    print(message.topic)
    print("메시지 내용: ")
    #print(message.payload)
    # 사서함에서 받은 Json 문자열을 객체로 변환
    dict = json.loads(message.payload.decode('UTF-8'))
    if dict['control'] == 'ventilator':
        print('ventilator===>')
        print(dict['value'])
    elif dict['control'] == 'humidifier':
        print('humidifier===>')
        print(dict['value'])

    #if ventilatorState == "on":
    #    ventilator.onVentilator(True)
    #else :
    #    ventilator.onVentilator(False)

'''

host = "a3urzfjm9f14zj.iot.ap-northeast-2.amazonaws.com"
rootCAPath = "../root-CA.crt"
certificatePath = "../dev01.cert.pem"
privateKeyPath = "../dev01.private.key"
useWebsocket = False
clientId = "client2"
topic = "topic_2"

# 실행하면서 로그를 남기기 위한 설정
logger = logging.getLogger("AWSIoTPythonSDK.core")
logger.setLevel(logging.DEBUG)
streamHandler = logging.StreamHandler()
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
streamHandler.setFormatter(formatter)
logger.addHandler(streamHandler)

# AWSIoTMQTTClient 초기화
myAWSIoTMQTTClient = AWSIoTMQTTClient(clientId)
myAWSIoTMQTTClient.configureEndpoint(host, 8883)
myAWSIoTMQTTClient.configureCredentials(rootCAPath, privateKeyPath, certificatePath)

# AWSIoTMQTTClient 연결에 대한 제어 정보 설정
myAWSIoTMQTTClient.configureAutoReconnectBackoffTime(1, 32, 20)
myAWSIoTMQTTClient.configureOfflinePublishQueueing(-1)  # Infinite offline Publish queueing
myAWSIoTMQTTClient.configureDrainingFrequency(2)  # Draining: 2 Hz
myAWSIoTMQTTClient.configureConnectDisconnectTimeout(10)  # 10 sec
myAWSIoTMQTTClient.configureMQTTOperationTimeout(5)  # 5 sec

# AWS IoT에 등록된 Thing과 연결
myAWSIoTMQTTClient.connect()
print("connect! \n")

# AWS IoT의 Thing의 'topic_1' 사서함을 구독하겠다고 선언
# 메시지를 받으면 customCallback 함수가 호출될 것이다.
myAWSIoTMQTTClient.subscribe(topic, 1, customCallback)

