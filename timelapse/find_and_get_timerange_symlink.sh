#! /bin/bash
# hagen 3.12.2016

#ln -s timelapse/2016-11-01_05-15/2016-11-01_05-15-timelapse-0100.jpg /lager2/WebCams/Hoe07_Zeitraffer_Bilder_sl/

#rm /lager2/WebCams/Hoe07_Zeitraffer_Bilder/2016-*
TLP="/lager2/WebCams/timelapse"
echo "07:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-0630.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "08:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-0990.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "09:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-1350.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "10:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-1710.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "11:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-2070.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "12:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-2430.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "13:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-2790.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "14:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-3150.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "15:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-3510.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "16:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-3870.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "17:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-4230.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "18:00 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-4590.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;

echo "07:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-0810.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "08:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-1170.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "09:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-1530.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "10:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-1890.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "11:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-2250.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "12:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-2610.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "13:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-2970.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "14:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-3330.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "15:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-3690.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "16:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-4050.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "17:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-4410.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;
echo "18:30 Uhr" ;  find /lager2/WebCams/timelapse -name "*-timelapse-4770.jpg"  -exec ln -s {} /lager2/WebCams/Hoe07_Zeitraffer_Bilder/  \;

cd /lager2/WebCams/Hoe07_Zeitraffer_Bilder/
pwd
/lager2/WebCams/find_blanks.sh












