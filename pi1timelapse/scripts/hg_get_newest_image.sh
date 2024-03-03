#! /bin/bash

PIC=`/usr/bin/find /srv/zeitraffer/  -type f | xargs ls -tr | tail -n 1`
cp $PIC /var/www/latest.jpg