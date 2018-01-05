# led 제어 모듈

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(27,GPIO.OUT)

def onHumidifier(state):
    GPIO.output(27, state)
