#! /bin/env python

#
# Use a button connected to GPIO input pin as reboot and poweroff button
#
# Simple press and release will do reboot
# Hold down (i.e. press but no release) for 5 seconds does power off
#
# Intended to be run as root, auto started by systemd

import os
import RPi.GPIO as GPIO

PIN_NUMBER = 18
POWER_OFF_HOLD_SECS  = 5

GPIO.setmode(GPIO.BCM)

#Set as input pin, pulled up (button will connect pin to ground)
GPIO.setup(PIN_NUMBER, GPIO.IN, pull_up_down=GPIO.PUD_UP)

GPIO.wait_for_edge(PIN_NUMBER, GPIO.FALLING)

rc = GPIO.wait_for_edge(PIN_NUMBER, GPIO.RISING, timeout=POWER_OFF_HOLD_SECS * 1000)

if rc is None:
    # Timed out, so held down therefore power off
    os.system("poweroff")
else:
    os.system("reboot")
    