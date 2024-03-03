#! /bin/bash

blanks="/lager2/WebCams/blanks"
if ! [ -d $blanks ] ; then
	mkdir -p $blanks
fi
blankfn="hg_blanks_free"
if [ -e  $blankfn ]
then
#	echo " $blankfn existiert -> next"
	exit 0
else
	echo " $blankfn existiert nicht -> suche Blanks"
fi
			
#for i in "$@"; do
for i in *.jpg; do 
    #echo -n "${i}"
    
    if [[ -e $(dirname "$i")/.$(basename "$i") ]]; then
        echo "   protected."
        continue
    fi

    histogram=$(convert "${i}" -threshold 50% -format %c histogram:info:-)
#    echo $histogram
    white=$(echo "${histogram}" | grep "white" | cut -d: -f1)
    black=$(echo "${histogram}" | grep "black" | cut -d: -f1)
    if [[ -z "$black" ]]; then
        black=0
    fi

    blank=$(echo "scale=0; ${black}/${white} " | bc)
##    blank=$(echo "scale=4; ${black}/${white} < 0.005" | bc)
##    echo "white: " $white  " black: "$black " leer--> "  $blank
#    echo "ratio: " $blank
    echo -n "."
    if [ "${blank}" -gt "100" ]; then
#        echo "${i} seems to be blank - removing it..."
        mv "${i}" "$blanks/${i}"
    fi
done
touch $blankfn 