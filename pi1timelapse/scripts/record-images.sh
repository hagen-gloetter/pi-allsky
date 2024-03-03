#!/bin/bash

service="timelapse"
if [ ! -e /lib/systemd/system/$service.service ]; then

cat <<EOF > /tmp/$service.service
[Unit]
Description=Timelapse raspi camera
After=network.target

[Service]
ExecStart=/bin/bash /root/timelapse.sh
Restart=always
RestartSec=10
StandardOutput=syslog

[Install]
WantedBy=multi-user.target
EOF

    install -m 0644 /tmp/$service.service /lib/systemd/system/
    systemctl --system daemon-reload
    systemctl enable $service.service
    systemctl restart $service.service
    systemctl status $service.service
    
    echo "sudo update-rc.d $service.service defaults"
    #$service.service defaults
    sudo apt-get install bc
    sudo apt-get install imagemagick imagemagick-doc 
    
    echo
    echo "$service will run automatically on reboot"
    exit 0
fi

# Goto 
cd /tmp

# make sure, that chronyd has set time
sleep 60

# make picture every "interval" seconds
interval=10

while true; do
  year=$(date +%Y)
  month=$(date +%m)
  mkdir -p $year/$month/{night,day}
  now=$(date --iso-8601=seconds)
  now_start=$(date +%s)
  filename="$year/$month/$now.jpg"
#  raspistill --hflip --vflip --width 1280 --height 960 -o "$filename"
  raspistill  --width 1280 --height 960 -o "$filename"

  # Berechne die durchschnittliche Helligkeit des Bildes
  bright=$(convert "$filename" -colorspace gray -format "%[fx:100*mean]" info:)
  echo $bright > bright

  # Berechne den Durchschnitt der letzten 10 Bilder
  if [ -f bright_avg ]; then
      bright_avg=$(cat bright_avg)
  else
      bright_avg=50
  fi
  echo 
  bright_avg=$( echo "$bright_avg * 10 + $bright" | bc -l ) 
  bright_avg=$( echo "$bright_avg / 11" | bc -l )
  echo "$bright_avg" > bright_avg
  #echo "$bright_avg" > bright_avg-$now

  bright_avg=$( echo "scale=0 ; $bright_avg/1" | bc -l )
  if [ $bright_avg -le 40 ]; then
      new_filename="$year/$month/night/$now.jpg"
  else
      new_filename="$year/$month/day/$now.jpg"
  fi
  mv "$filename" "$new_filename"
  filename="$new_filename"
  ( 
    #rsync -a "$year" pi@10.2.1.1:/home/media/video/timelapse/garten/
    rsync -a "$year" sternwarte@192.168.4.1:/lager2/WebCams/timelapse/
    rm -f "$filename"
  ) &
  now_end=$(date +%s)
  used=$[ $now_end - $now_start ]
  if [ "$used" -lt "$interval" ]; then
    wait=$[ $interval - $used ]
    sleep $wait
  fi
done
