#!/bin/bash

service mariadb start

sleep 3
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};"
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"
sleep 2

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'