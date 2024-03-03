#! /bin/bash


#rsync -ave ssh /srv/zeitraffer/  sternwarte@192.168.4.1:/lager2/WebCams/timelapse/
rsync -ave ssh /srv/zeitraffer/  sternwarte@192.168.4.1:/lager2/WebCams/zeitraffer_einzelbilder/
#find /srv/zeitraffer/  -mindepth 1 -mtime +2 -delete
