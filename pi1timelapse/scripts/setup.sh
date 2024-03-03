#! /bin/bash
sudo apt-get install -y vim subversion mc apache2 php nmon htop screen perl scite figlet rpi-update

sudo mkdir /srv/zeitraffer/
sudo chown pi.pi /srv/zeitraffer/
sudo chmod 775 /home/pi/scripts/*sh

echo "crontab anpassen"                                                   
echo "15  5  * * *  bash /home/pi/scripts/hg_picam_timelapse.sh" 
echo "30 22  * * *  bash /home/pi/scripts/hg_find_and_clear_old_pics.sh"
echo "10 */1 * * *  bash /home/pi/scripts/hg_rsync_atlas.sh"
echo "@reboot bash /home/pi/scripts/hg_rsync_atlas.sh"
echo ""

figlet modify Apache
sudo perl -pi -e 's#</VirtualHost>#\#</VirtualHost>#g' /etc/apache2/sites-enabled/000-default.conf
sudo echo "
        <Directory /srv/zeitraffer/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
        </Directory>
</VirtualHost>
" >> /etc/apache2/sites-enabled/000-default.conf
#sudo vi /etc/apache2/sites-enabled/000-default.conf
sudo mv /var/www/html/index.html /var/www/html/index_old.html
sudo cp ~/scripts/index.php /var/www/html/
sudo chown -R www-data.www-data  /var/www/html
# modify Apache  

figlet make startup job
#ln -s /home/pi/scripts/hg_picam_timelapse.sh /etc/rc3.d/S99myscript
#echo "add to crontab via -crontab -e"
#echo "@reboot  /home/pi/scripts/hg_picam_timelapse.sh"
# --- cooles Tool : https://gist.github.com/naholyr/4275302

# INITD IS NO MORE USED
#sudo cp zeitraffer-initd.sh /etc/init.d/zeitraffer
#sudo update-rc.d zeitraffer defaults
#sudo touch /var/log/zeitraffer.log
#sudo chown pi.pi /var/log/zeitraffer.log
#sudo service zeitraffer start
## sudo update-rc.d zeitraffer remove

# SYSTEMD
#https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=138861
sudo cp zeitraffer.service /etc/systemd/system/
sudo systemctl enable zeitraffer.service
sudo systemctl start zeitraffer
#sudo systemctl stop zeitraffer

figlet firmware update
sudo rpi-update

sudo vi /boot/config.txt
echo "disable_camera_led=1"


figlet done
