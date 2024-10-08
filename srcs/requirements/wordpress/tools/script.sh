#!/bin/sh

cd /var/www/html
# Set appropriate permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

sleep 5
wp core download --path=/var/www/html --allow-root
sleep 3
wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb:3306" --extra-php --allow-root
wp core install --url="https://bgannoun.42.fr" --title="My WordPress Site" --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email --allow-root


$@