#!/bin/bash
apt update
apt -y upgrade
apt -y install mc
apt -y install ftpd
apt -y install apache2
apt -y install apache2-utils
apt -y install libpq5
#Установка PHP
apt -y install php
apt -y install libapache2-mod-php
apt -y install php-fpm
apt -y install php-intl
apt -y install php-dev
apt -y install php-mysql
apt -y install php-pgsql
apt -y install php-mbstring
apt -y install php-xml
apt -y install php-gd
apt -y install php-curl
apt -y install php-common 
apt -y install php-cli
apt -y install php-common
apt -y install php-json
apt -y install php-opcache
apt -y install php-readline
apt -y install php-mcrypt
apt -y install php-snmp
apt -y install php-bcmath
a2enconf php-fpm.conf
service php-fpm reload
systemctl restart apache2
cd /var/www/html
touch index.php
sudo sh -c "echo '<?php phpinfo() ?>' >> index.php"
cd /
#---------------------------------------------------------------------------------------------------------------------------
#Установка MariaDB (MySql)
echo MARIADB
apt-get -y install software-properties-common
apt update
apt -y install mariadb-server
apt -y install mariadb-client
systemctl stop mariadb.service
systemctl start mariadb.service
systemctl enable mariadb.service
#Настройка
mysql_secure_installation
#Enter current password for root (enter for none): Жмем Enter, по дефолту пароля нет
#Set root password? [Y/n]: Y
#New password: Указываем пароль
#Re-enter new password: Указываем повторно пароль
#Remove anonymous users? [Y/n]: Y
#Disallow root login remotely? [Y/n]: Y
#Remove test database and access to it? [Y/n]: Y
#Reload privilege tables now? [Y/n]: Y
systemctl start mariadb.service 
apt -y install phpmyadmin
 #-----------------------------------------------------------------------------------------------------------------------------------
#Установка Postgresql
echo POSTGRESQL
apt -y install postgresql
apt -y install postgresql-contrib
apt -y install phppgadmin
cd /etc/apache2/conf-available/
sed -i 's/Require local/#Require local/' phppgadmin.conf
sed -i '/#Require local/a Allow From all' phppgadmin.conf
cd /etc/phppgadmin/
sed -i '/extra_login_security/s/true/false/' config.inc.php
cd /
systemctl restart postgresql
systemctl restart apache2
apt -y autoremove
reboot
