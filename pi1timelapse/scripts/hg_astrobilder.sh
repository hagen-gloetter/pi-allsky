#/bin/sh

cd `dirname $0`
cd /srv/zeitraffer
# sleep 7200
#raspistill -bm -tl 1000 -v -set -ISO 800 -awb off -awbg 1,1 -t 21600000 -ss 10000000 -o %01d.jpg
raspistill -bm -tl 1000 -v -set -ISO 3200 -awb off -awbg 1,1 -t 21600000 -ss 10000000 -o %04d.jpg

