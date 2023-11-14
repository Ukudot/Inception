#!/bin/bash
# start mariadb service
service mariadb start

# check if this script has been already launched

mariadb -uroot -e "SHOW DATABASES;" 1> /dev/null 2>&1 && (
	# mariadb-secure-installation
	mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
	sleep .1
	mariadb -uroot -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
	sleep .1
	mariadb -uroot -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
	sleep .1
	mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"
	sleep .1
	mariadb -uroot -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	sleep .1
)

# stop mariadb
mysqladmin -uroot -p$MARIADB_ROOT_PASSWORD shutdown

# unset env variables for security reasons
unset MARIADB_DATABASE MARIADB_USER MARIADB_USER_PASSWORD MARIADB_ROOT_PASSWORD

exec mysqld_safe
