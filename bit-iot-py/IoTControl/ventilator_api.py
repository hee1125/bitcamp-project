# led 제어 모듈

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(24,GPIO.OUT)

def onVentilator(state):
    GPIO.output(24, state)
