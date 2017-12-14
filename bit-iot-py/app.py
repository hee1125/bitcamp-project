import serial
import time

# 아두이노 시리얼 포트 연결 & 데이터 보내기!
serialNo = "192.168.10.125"
ser = serial.Serial('/dev/ttyACM0') # 시리얼 포트를 준비한다.
time.sleep(2) # 장비와 연결될 시간을 확보한다.
print("실행 완료!")


def onLed(state):
    ser.write(bytes(state))
    print("우선 state = 1 들어감!")
