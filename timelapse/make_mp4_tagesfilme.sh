#!/bin/bash

# http://trac.ffmpeg.org/wiki/Create%20a%20video%20slideshow%20from%20images
# http://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/
# http://spielwiese.la-evento.com/hokuspokus/


baseDir="/lager2/WebCams"
timelapseDir="$baseDir/timelapse"
#timelapseDir="$baseDir/zeitraffer_astrotag"
outDir="$baseDir/tagesfilme"

JpgDir=$baseDir"/Hoe07_Zeitraffer_Bilder"
OutFile=$baseDir"/ffmpeg-timeleape-"$(date +"-%Y-%m-%d--%H-%M")".mp4"
Sound=$baseDir"/Sound/Haus_Basic_Motion_TerraSound_de.mp3"



cd $timelapseDir
typeset -a ordnerliste
typeset -a bilder
echo -n "Ordersuche starten"
pwd
#ordnerliste=(`find $timelapseDir -maxdepth 1 -type d -exec basename {} \;`)
ordnerliste=(`find $timelapseDir -maxdepth 1 -type d`)
#echo ${ordnerliste[*]}
echo "Ordersuche fertig"
for ordner in ${ordnerliste[*]}
do
	dateDir=`basename $ordner`
	mp4name="$outDir/$dateDir.mp4"
#	echo -n "Entering Bilderordner=<$ordner> Dir=$dateDir "
	cd $ordner
#	echo -n "looking for $mp4name"
	
	if [ -e  $mp4name ]
	then
		cd $ordner
    else
		anzahl=`find $ordner -maxdepth 1 -name "*.jpg"  -type f  | wc -l`
		if [ $anzahl -gt 0 ]
		then
			echo " Bilder=$anzahl"
				echo -n "looking for $mp4name"
					echo " $mp4name existiert nicht -> erzeuge Film"
					echo "removing blanks"
					eval /lager2/WebCams/find_blanks.sh
					echo " $mp4name existiert nicht -> erzeuge Film"
					CMD="nice ffmpeg -thread_queue_size 512 -framerate 30 -pattern_type glob -i \"$ordner/*.jpg\" -i $Sound -shortest  -c:v libx264 -acodec copy -flags global_header -pix_fmt yuv420p -s 1280x720  $mp4name &"
					echo "-----------------------------------------"
					echo $CMD
					echo "-----------------------------------------"
					eval $CMD
#				fi
		else
			echo "Komisch: Keine Bilder in $ordner "
		fi
	fi
done



exit
for ordner in ${ordnerliste[*]}
do
	
	fqordner="$timelapseDir/$ordner"
	# echo "Entering Bilderordner=$fqordner - Ordner=$ordner - tlDir=$timelapseDir"
	cd $fqordner
	echo "bilderordner=$fqordner"
	#        anzahl=`find -mindepth 2 -type f -name $ordner | wc -l`
		anzahl=`find . -name "*.jpg" -type f  | wc -l`
		if [ $anzahl -gt 0 ]
		then
			echo "Entering $fqordner -  $ordner - $anzahl Dateien "
			mp4name="$outDir/$ordner.mp4"
			echo "looking for $mp4name"
			if [ -e  $mp4name ]
			then
				echo "$mp4name existiert -> next"
			else
				echo "$mp4name existiert nicht -> erzeuge Film"
				CMD="ffmpeg -framerate 30 -pattern_type glob -i \"$fqordner/*.jpg\" -i $Sound -c:v libx264  -acodec copy -s 1280x720 $mp4name"
				echo "-----------------------------------------"
				echo $CMD
				echo "-----------------------------------------"
				eval $CMD
			fi
			#bilder=(`find . -name "*.jpg"  -exec basename {} \;`)
			#for bild in ${bilder[*]}
			#do
			# echo "Bild: $bilder"
			#done
		fi
done

exit 0



baseDir="/lager2/WebCams"
JpgDir=$baseDir"/Hoe07_Zeitraffer_Bilder"
OutFile=$baseDir"/ffmpeg-timeleape-"$(date +"-%Y-%m-%d--%H-%M")".mp4"
Sound=$baseDir"/Sound/Haus_Basic_Motion_TerraSound_de.mp3"

cd $JpgDir
echo "-----------------------------------------"
echo "Processing Dir:"
pwd
echo "$JpgDir"
echo "$OutFile"
echo "$Sound"
echo "-----------------------------------------"

$baseDir/scripts/find_and_get_timerange_symlink.sh
$baseDir/find_blanks.sh



#ffmpeg -r 30 -i $Sound  -pattern_type glob -i '*.jpg' -c:v libx264 -acodec copy -s 1280x720 $OutFile
#ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -c:v libx264 -i $Sound -acodec copy -s 1280x720 $OutFile
GLOB="$JpgDir/\*.jpg"
CMD="ffmpeg -framerate 30 -pattern_type glob -i \"$JpgDir/*.jpg\" -i $Sound -c:v libx264  -acodec copy -s 1280x720 $OutFile"
echo "-----------------------------------------"
echo $CMD
echo "-----------------------------------------"
eval $CMD
cd $baseDir

#ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -c:v libx264 ../ffmpeg-out-test.mp4


#NanoMeterGiraffe73
