#!/usr/bin/env python
#coding: utf8 
 
import RPi.GPIO as GPIO
import os
import time
 
# Pins festlegen
GPIO.setmode(GPIO.BOARD)
PIN1_OBEN=12 # GPIO 18
PIN2_MITTE=16 # GPIO 23
PIN3_UNTEN=18 # GPIO 24

# Pin 18 (GPIO 24) als Eingang festlegen
GPIO.setup(PIN1_OBEN, GPIO.IN, pull_up_down = GPIO.PUD_UP)
GPIO.setup(PIN2_MITTE, GPIO.IN, pull_up_down = GPIO.PUD_UP)
GPIO.setup(PIN3_UNTEN, GPIO.IN, pull_up_down = GPIO.PUD_UP)
 
# Schleifenzähler
i = 0
j = 0
k = 0
lock1=0
lock2=0
lock3=0
 
# Endlosschleife
while 1:
    datum = time.strftime("%Y %H:%M:%S", time.gmtime())
    # Eingang lesen
    if GPIO.input(PIN1_OBEN) == GPIO.HIGH:
        i = 0
        lock1=0

    if GPIO.input(PIN1_OBEN) == GPIO.LOW:
        i = i + 1

    if GPIO.input(PIN2_MITTE) == GPIO.HIGH:
        j = 0
        lock2=0

    if GPIO.input(PIN2_MITTE) == GPIO.LOW:
        j = j + 1

    if GPIO.input(PIN3_UNTEN) == GPIO.HIGH:
        k = 0
        lock3=0

    if GPIO.input(PIN3_UNTEN) == GPIO.LOW:
        k = k + 1

    if (i > 100 and lock1==0) :
        lock1=1
        print (datum + " - oben - hg_camausrichtung30sek")
        cmd="sudo /bin/sh -c 'bash /home/pi/scripts/hg_camausrichtung30sek.sh > /dev/tty1'"
#        cmd="sh -c ' ls -lah > /dev/tty1' "
        os.system('wall "testbild " ')
        os.system(cmd)
        os.system('wall "done" ')
#        os.system('wall "testbild " ; fbcp & ; sleep .5 ; raspivid -t 0 & ; sleep 30 ; killall raspivid ; killall fbcp ; wall "done" ')

    if (j > 100 and lock2==0) :
        lock2=1
        print (datum + " - mitte - zeitraffer start")
        os.system('wall "zeitraffer starting" ; sudo service zeitraffer start ; wall "done" ' )

    if (k > 100 and lock3==0) :
        lock3=1
        print (datum + " - unten - zeitraffer stop")
        os.system('wall "zeitraffer stoping" ; sudo service zeitraffer stop ; wall "done" ')

