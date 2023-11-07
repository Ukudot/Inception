# start mariadb service
service mariadb start

# mariadb-secure-installation
mariadb -e "CREATE DATABASE $MARIADB_DATABASE"
mariadb -e "CREATE USER '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_USER_PASSWORD'"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost'"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'"
mariadb -uroot -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES"

# stop mariadb
mysqladmin -uroot -p$MARIADB_ROOT_PASSWORD shutdown

# unset env variables for security reasons
unset MARIADB_DATABASE MARIADB_USER MARIADB_USER_PASSWORD MARIADB_ROOT_PASSWORD
