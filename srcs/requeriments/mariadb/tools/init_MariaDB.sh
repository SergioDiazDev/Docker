#!/bin/bash
service mariadb start

mysql -e "create database if not exists $NAME;"
mysql -e "create user if not exists '$USER1'@'%' identified by '$PASS1';"
mysql -e "grant all privileges on $NAME.* TO '$USER1'@'%';"
mysql -e "flush privileges;"

pkill -f mysqld

mysqld