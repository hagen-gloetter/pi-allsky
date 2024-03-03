 #!/bin/bash

PFAD="/srv/zeitraffer"

# PFADEund Setup
cd $PFAD
HEUTE=`date +"%Y-%m-%d"`
mkdir -p $PFAD/$HEUTE
cd $PFAD/$HEUTE

DATUM=`date +"%Y-%m-%d_%H-%M-%S"`
EXT=".jpg"
filename="$PFAD/raspiCam-$DATUM$EXT"
echo -n "writing $filename "
raspistill  --width 1280 --height 960 -o "$filename"
echo

SYNC=`rsync -ave ssh $PFAD/ sternwarte@192.168.4.1:/lager2/WebCams/timelapse/`

exit 0


# http://xmodulo.com/create-time-lapse-video-raspberry-pi.html

