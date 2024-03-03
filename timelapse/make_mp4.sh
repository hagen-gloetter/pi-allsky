# http://trac.ffmpeg.org/wiki/Create%20a%20video%20slideshow%20from%20images
# http://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/
# http://spielwiese.la-evento.com/hokuspokus/



baseDir="/lager2/WebCams"
JpgDir=$baseDir"/Hoe07_Zeitraffer_Bilder"
OutFile=$baseDir"/ffmpeg-timeleape-"$(date +"-%Y-%m-%d--%H-%M")".mp4"
Sound=$baseDir"/Sound/SoundCloud-SHAPING_LIGHTS.v2.mp3"

cd $JpgDir
echo "-----------------------------------------"
echo "Processing Dir:"
pwd
echo "baseDir=$baseDir"
echo "JpgDir=$JpgDir"
echo "OutFile=$OutFile"
echo "Sound=$Sound"
echo "-----------------------------------------"

echo "find_and_get_timerange_symlink"
$baseDir/scripts/find_and_get_timerange_symlink.sh 2> find_and_get_timerange_symlink.log
#echo "find_blanks"
#$baseDir/find_blanks.sh 2> find_blanks.log

#ffmpeg -r 30 -i $Sound  -pattern_type glob -i '*.jpg' -c:v libx264 -acodec copy -s 1280x720 $OutFile
#ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -c:v libx264 -i $Sound -acodec copy -s 1280x720 $OutFile
GLOB="$JpgDir/\*.jpg"
#CMD="ffmpeg -thread_queue_size 512 -framerate 30 -pattern_type glob -i \"$JpgDir/*.jpg\" -i $Sound -c:v libx264 -acodec copy -s 1280x720 $OutFile"
# deshake  http://adaptivesamples.com/2014/05/30/camera-stabilisation-with-ffmpeg/
# -vf deshake
#CMD="ffmpeg -thread_queue_size 512 -framerate 30 -pattern_type glob -i \"$JpgDir/*.jpg\" -i $Sound -vf deshake -c:v libx264 -acodec copy -flags global_header -pix_fmt yuv420p -s 1280x720  $OutFile"
CMD="ffmpeg -thread_queue_size 1024 -framerate 30 -pattern_type glob -i \"$JpgDir/*.jpg\" -i $Sound -vf deshake -c:v libx264 -acodec copy -flags global_header -pix_fmt yuv420p -s 1280x720  $OutFile"
CMD="ffmpeg -thread_queue_size 1024 -framerate 30 -pattern_type glob -i \"$JpgDir/*.jpg\" -i $Sound   -c:v libx264 -acodec copy -flags global_header -pix_fmt yuv420p -s 1280x720  $OutFile"


echo "-----------------------------------------"
echo $CMD
echo "-----------------------------------------"
eval $CMD
cd $baseDir

#ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -c:v libx264 ../ffmpeg-out-test.mp4


#NanoMeterGiraffe73
