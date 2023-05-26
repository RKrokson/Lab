#!/bin/bash

# find the line starting with bind-address in the file /etc/mysql/mysql.conf.d/mysqld.cnf and comment it out
sed -i '/bind-address/s/^/#/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# restart mysql
service mysql restart

# connect to mysql and create a database
# mysql -u root -p
# create database testdb;
# create user 'mysqluser'@'localhost' identified by 'password';
# grant all on testdb.* to 'mysqluser'@'%' identified by 'password';
