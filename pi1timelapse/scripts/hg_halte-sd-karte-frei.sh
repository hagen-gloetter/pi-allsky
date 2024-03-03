#! /bin/bash

BASEDIR="/srv/zeitraffer"
DAYSIZE=4200000  # rund 4,2GB entstehen pro Tag

cd $BASEDIR
FREESPACE=`df .  --output=avail | grep -v '\.' | cut -d ' ' -f 3`
echo "es sind noch $FREESPACE Bytes frei"
if [ $FREESPACE -gt $DAYSIZE ]
then
  echo "alles Ok genug Platz vorhanden"
else
  echo "loesche alteste Bilder"
  # nur verzeichnisse suchen die mit 20 (2017) anfangen
  OLDESTDIR=`for i in $(ls -d 20*/); do echo ${i}; done | head -n 1 `    
  LAENGE=${#OLDESTDIR}
  # neur löschen wenn sie 17 Zeichen (2017-07-09_14-30) lang sind
  if [ $LAENGE -eq 17 ]
  then
    echo "loesche $BASEDIR/$OLDESTDIR "
    rm -rf $BASEDIR/$OLDESTDIR
  else
    echo "Verzeichnis Laenge stimmt nicht $LAENGE"
  fi  
fi

