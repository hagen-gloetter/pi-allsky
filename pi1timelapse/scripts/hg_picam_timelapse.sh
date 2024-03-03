#!/bin/bash

PFAD="/srv/zeitraffer"
INTERVALL=10
DAUER=19

# PFADEund Setup
cd $PFAD
HEUTE=`date +"%Y-%m-%d_%H-%M"`
mkdir -p $PFAD/$HEUTE
cd $PFAD/$HEUTE

xres="2592"
yres="1944"


# Sekunden zu Millisekunden
let INTERVALL=INTERVALL*1000
# Stunden zu Millisekunden
let DAUER=DAUER*60*60*1000

#raspistill --width 1280 --height 960 -o $PFAD/$HEUTE/$HEUTE-timelapse-%04d.jpg -tl $INTERVALL -t $DAUER
raspistill --verbose --width $xres --height $yres -o $PFAD/$HEUTE/$HEUTE-timelapse-%04d.jpg -tl $INTERVALL -t $DAUER

SYNC=`rsync -ave ssh $PFAD/ sternwarte@192.168.4.1:/lager2/WebCams/zeitraffer_einzelbilder/`

exit 0

COUNTER=0
LOOP=0 # do it forever

while [  $LOOP -lt 10 ]; do
#     echo The counter is $COUNTER
        DATUM=`date +"%Y-%m-%d_%H-%M-%S"`
        EXT=".jpg"
        filename="$PFAD/raspiCam-$DATUM$EXT"
        echo -n "writing $COUNTER $filename "
#        raspistill  --width 1280 --height 960 -o "$filename"
        raspistill  --width $xres --height $yres -o "$filename"
#        echo -n " - sync"
#        SYNC=`rsync -ave ssh $filename sternwarte@192.168.4.1:/lager2/WebCams/timelapse/`
#        echo " - done"

        sleep $INTERVALL
        rm $filename
        let COUNTER=COUNTER+1
done

/home/pi/scripts/hg_rsync_atlas.sh


# http://xmodulo.com/create-time-lapse-video-raspberry-pi.html

