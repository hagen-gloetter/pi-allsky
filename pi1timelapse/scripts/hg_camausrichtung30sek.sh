#! /bin/bash

fbcp &
sleep .5
raspivid -t 0 &

sleep 30

killall raspivid
killall fbcp
reset
#sudo fbi -d /dev/fb1 -T 1 -noverbose -a RasPiCamBild.jpg

#
#fbcp & ; sleep .5 ; raspivid -t 0 & ; sleep 30 ; killall raspivid ; killall fbcp ;

