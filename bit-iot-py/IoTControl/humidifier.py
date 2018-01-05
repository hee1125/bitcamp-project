import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

GPIO.setup(2,GPIO.OUT)
GPIO.output(2, False)

GPIO.output(2, True)

time.sleep(1)

GPIO.output(2, False)

GPIO.cleanup()