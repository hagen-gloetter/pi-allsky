#! /bin/bash

MTIME="-mtime -7"
MTIME=$1
 case $MTIMEIT in
   "all"   ) MTIME=" " ;;
   "day"   ) MTIME="-mtime -1 "  ;;
   "week"  ) MTIME="-mtime -7 "  ;;
   "month" ) MTIME="-mtime -31 " ;;
   *       ) MTIME="-mtime -7 "  ;;
 esac

#for i in `find -mtime -7`; do  echo $i ; done

cd /lager2/WebCams/timelapse/
echo "chown with $MTIME"
sudo nice find /lager2/WebCams/timelapse/ -type d $MTIME -exec sudo chown -R sternwarte.hagen {} \;
sudo nice find /lager2/WebCams/timelapse/ -type d $MTIME -exec sudo chown -R sternwarte.hagen {} \;
sudo nice find /lager2/WebCams/blanks/    -type d $MTIME -exec sudo chown -R sternwarte.hagen {} \;
sudo nice find /lager2/WebCams/blanks/    -type d $MTIME -exec sudo chown -R sternwarte.hagen {} \;

#sudo chown -R sternwarte.hagen /lager2/WebCams/timelapse/*
#sudo chown -R sternwarte.hagen /lager2/WebCams/blanks/*
#*/

echo "dirs"
sudo nice find /lager2/WebCams/timelapse/ -type d $MTIME -exec chmod 775 {} \; &
echo "bilder"
#find /lager2/WebCams/timelapse/ -type f -iname '*.jpg' -print0 | xargs -0 sudo chmod 0644
sudo nice find /lager2/WebCams/timelapse/ -type f $MTIME -iname '*.jpg' -exec chmod 664 {} \;
echo "done"
