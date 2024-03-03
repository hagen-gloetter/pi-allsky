#! /bin/bash

if [ $1 -le 2 ] ; then
echo "---------------------------------------"
/usr/bin/figlet -f small Zeitraffer
fi
if [ $1 -eq 1 ] ; then
/usr/bin/figlet -f small start
fi

if [ $1 -eq 2 ] ; then
/usr/bin/figlet -f small stop
fi

if [ $1 -le 2 ] ; then
echo "---------------------------------------"
fi
#  >/dev/tty1

