#!/bin/bash

if ! test -f /var/www/wordpress/wp-config.php; then
	wp-cli.phar config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	wp-cli.phar core install --allow-root \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--path='/var/www/wordpress'

	wp-cli.phar user create $WP_USER $WP_USER_EMAIL --allow-root \
		--role='author' \
		--user_pass=$WP_USER_PASSWORD \
		--porcelain \
		--path='/var/www/wordpress'
fi

# start php
exec /usr/sbin/php-fpm8.2 -F
