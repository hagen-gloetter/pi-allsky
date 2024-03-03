#! /bin/bash

RANGE="-mtime -7"
RANGE=$1
 case $RANGEIT in
   "all"   ) RANGE=" " ;;
   "week"  ) RANGE="-mtime -7 " ;;
   "month" ) RANGE="-mtime -31 " ;;
   *       ) RANGE="-mtime -7 " ;;
 esac


cd /lager2/WebCams/timelapse/
echo "chown"
sudo chown -R sternwarte.hagen /lager2/WebCams/timelapse/* 
sudo chown -R sternwarte.hagen /lager2/WebCams/blanks/* 
#*/

echo "dirs"
sudo nice find /lager2/WebCams/timelapse/ -type d $RANGE -exec chmod 775 {} \; &
echo "bilder"
#find /lager2/WebCams/timelapse/ -type f -iname '*.jpg' -print0 | xargs -0 sudo chmod 0644
sudo nice find /lager2/WebCams/timelapse/ -type f $RANGE -iname '*.jpg' -exec chmod 664 {} \;
echo "done"

