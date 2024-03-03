#!/bin/bash
# Wasserzeichentext in alle JPEG Bilder aus diesen Verzeichnis einfuegen
# Der Wasserzeichentext wird unten links ins Bild eingebracht
# Sie koennen folgende Parameter anpassen:
Textabstandvonlinks=10
Textabstandvonunten=10
Schriftgroesse=10
PfadFonts="/usr/share/fonts/truetype/msttcorefonts"
# Pfad ist je nach Distribution unterschiedlich!
Schriftart="Arial.ttf"
Schriftfarbe="white"
# Moegliche Farben koennen aufgelistet werden mit dem Befehl: convert -list color
Wasserzeichentext="Copyright Ubuntu"

# Programmbeginn
echo "Textabstand von links: $Textabstandvonlinks"
echo "Textabstand von unten: $Textabstandvonunten"
echo "Schriftgoesse: $Schriftgroesse"
echo "Schriftart: $Schriftart"
echo "Schriftfarbe: $Schriftfarbe"
echo "Wasserzeichentext: $Wasserzeichentext"
echo " "
for file in *.JPG *.jpg
do
  horizontal=`identify -verbose $file | grep Geometry: | awk {'print $2'} |cut -d"x" -f 1`
  vertikal=`identify -verbose $file | grep Geometry: | awk {'print $2'} |cut -d"x" -f 2`
  X=$Textabstandvonlinks
  Y=$(($vertikal - $Textabstandvonunten))
  convert -font $PfadFonts/$Schriftart -pointsize $Schriftgroesse -fill $Schriftfarbe -draw "text $X, $Y '$Wasserzeichentext'" "$file" "`basename Wasserzeichen_"$file"`";
  echo "Bearbeite Datei $file"
done
echo "Wasserzeichen wurden erfolgreich eingearbeitet"
exit
# Programmende
#https://wiki.ubuntuusers.de/ImageMagick/

#https://linux-club.de/forum/viewtopic.php?t=49091
ls -1 *.jpg | while read file;
do convert -font /usr/X11R6/lib/X11/fonts/truetype/SUSESansMono-Bold.ttf -pointsize 30 -fill white -draw "text 1024,1500 'Copyright by Cero'" "$file" "`basename Wasserzeichen_"$file"`";
done

# https://www.computerfrage.net/frage/welche-software-fuer-linux-gibt-es-um-meine-fotos-automatisch-mit-wasserzeichen-zu-versehen
for bild in *.jpg do convert -resize 800x600 -font arial -pointsize 15 -fill red -draw "text 580,565 'Copyright by Master67'" "$bild" "${bild%.jpg}_wasserz.jpg"