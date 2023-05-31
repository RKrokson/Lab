#!/bin/bash

# find the line starting with bind-address in the file /etc/mysql/mysql.conf.d/mysqld.cnf and comment it out
sed -i '/bind-address/s/^/#/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# restart mysql
service mysql restart

# connect to mysql, create a database, give privileges to a user (change password to your password)
sudo mysql -u root
create database testdb;
create user 'mysqluser'@'localhost' identified by 'password';
GRANT ALL PRIVILEGES ON *.* TO 'mysqluser'@'%' identified by 'password';
