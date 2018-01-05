# led 제어 모듈

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(2,GPIO.OUT)

def onHumidifier(state):
    GPIO.output(2, state)
