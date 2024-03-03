#! /bin/bash

filmdir="/lager2/WebCams/fertige_timelapse_filme"
basedir="/lager2/WebCams/timelapse_wolken"
basedir="/lager2/WebCams/timelapse"
sound="/lager2/WebCams/Sound/Wolken_Piano_Rain_TerraSound_de.mp3"
echo "-----------------"
echo "basedir=$basedir"
echo "filmdir=$filmdir"
echo "-----------------"
cd $basedir
# Alle Verzeichnisse in dem Ordner finden
# Schleife über alle Ordner
for ORDNER in `ls -1 $basedir`
do
# Fime erzeugen und in Zielordner mit "Ordnernamen" ablegen
echo "----------------- Schleife start ----------"
echo "bearbeite: $ORDNER"
OutFile="$filmdir/ffmpeg-$ORDNER.mp4"
echo "OutFile=$OutFile"
cd $basedir/$ORDNER/
Bilder="$basedir/$ORDNER/*.jpg"
echo -n "Verzeichnis:"
pwd
echo "-----------------"
CMD="/usr/bin/ffmpeg -thread_queue_size 5000 -framerate 30 -pattern_type glob -i \"$Bilder\" -i $sound -c:v libx264  -acodec copy -s 1280x720 $OutFile"
#`/usr/bin/ffmpeg -thread_queue_size 5000 -framerate 30 -pattern_type glob -i "$Bilder" -i $sound -c:v libx264  -acodec copy -s 1280x720 $OutFile`
echo "CMD=$CMD"
#`$CMD`
echo $CMD >> "$filmdir/ffmpeg.txt"
echo "----------------- Schleife ende ----------"
done


exit


basedir="/lager2/WebCams/Hoe09_Zeitraffer/"
#for f in raspiCam-*.jpg; do 
#        ffmpeg -pattern_type sequence -r 30 -i "timelapse/raspiCam-%06d.jpg" -c:v libx264 -r 30 -s 1024x768 zeitraffer.mp4
#; done

#	ffmpeg -i "$f" "${f%.png}.jpg"
#        ffmpeg -pattern_type sequence -r 10 -i "timelapse/raspiCam-%06d.jpg" -c:v hevc -b:v 768000 -r 20 -s 1024x768 zeitraffer.mp4

for f in `ls $basedir`
do
#        ffmpeg -pattern_type sequence -r 30 -i "$basedir/raspiCam-%06d.jpg" -c:v libx264 -r 30 -s 1024x768 zeitraffer.mp4
# avconv -r 10 -i timelapse_%04d.jpg   -r 10 -vcodec libx264 -crf 20 -g 15 -vf crop=2592:1458,scale=1280:720  zeitraffer.mp4
avconv -r 10 -i "$basedir/$f"    -r 10 -vcodec libx264 -crf 20 -g 15   zeitraffer.mp4

done




for f in *.jpg; do avconv -i "$f" -c:a alac "${f%.flac}.m4a"; done


avconv -r 10 -i raspiCam-%04d-%02d-%02d_%02d-%02d-%02d.jpg    -r 10 -vcodec libx264 -crf 20 -g 15   ../zeitraffer.mp4


avconv -r 10 -start_number 8 -i timeleap$(date +"-%Y-%m-%d--%H-%M").jpg -b:v 1000k test.avi

avconv -r 10 -start_number 8 -i raspiCam-$(date +"%Y-%m-%d_%H-%M-%S").jpg -b:v 1000k test.avi

avconv -r 10 -start_number 8 -i raspiCam-$(date +"%Y-%m-%d_%H-%M-%S").jpg  -r 10 -vcodec libx264 -crf 20 -g 15   zeitraffer.mp4

date +"%Y-%m-%d_%H-%M-%S"


cat *.jpg  | avconv -f image2pipe -r 10 -vcodec libx264 -crf 20 -g 15   zeitraffer.mp4


