#! /bin/bash

sleep 5 ; # takes a while for Pi to boot 
wall "TimeLapse Start"
cd ~/scripts/
/usr/bin/python ~/scripts/display_gpio.py
