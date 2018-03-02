#!/bin/bash

echo "Provisioning virtual machine..."
apt-get update #> /dev/null

echo "Installing Git"
apt-get install git -y #> /dev/null

echo "Installing Nginx"
apt-get install nginx -y #> /dev/null

echo "Installing PHP..."
apt-get install -y php7.0 php7.0-fpm #> /dev/null

echo "Installing PHP extensions..."
apt-get install -y php7.0-curl php7.0-mysql #> /dev/null

echo "Preparing MySQL..."
apt-get install -y debconf-utils #> /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySQL..."
apt-get install -y mysql-server #> /dev/null

# Nginx Config
echo "Configuring Nginx..."

rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-available/nginx_vhost
rm -rf /etc/nginx/sites-enabled/nginx_vhost

cp /var/www/nginx_vhost /etc/nginx/sites-available/nginx_vhost #> /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/nginx_vhost

# Restarting Nginx for config to take effect
echo "Restarting Nginx..."
service nginx restart #> /dev/null