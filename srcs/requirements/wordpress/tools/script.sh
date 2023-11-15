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

	wp-cli.phar plugin install redis-cache \
		--version=2.4.4 \
		--force \
		--activate \
		--allow-root \
		--path='/var/www/wordpress'

	# insert conf setup for redis plugin
	sed -i "0,/^$/{s/^$/\/\/ adjust Redis host and port if necessary\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/define( 'WP_REDIS_HOST', 'redis' );\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/define( 'WP_REDIS_PORT', '6379' );\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/\/\/ change the prefix and database for each site to avoid cache data collisions\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/define( 'WP_REDIS_PREFIX', 'my-moms-site' );\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/define( 'WP_REDIS_DATABASE', 0 );\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/\/\/ reasonable connection and read+write timeouts\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/define( 'WP_REDIS_TIMEOUT', 1 );\n/}" /var/www/wordpress/wp-config.php
	sed -i "0,/^$/{s/^$/define( 'WP_REDIS_READ_TIMEOUT', 1 );\n/}" /var/www/wordpress/wp-config.php
	
fi

# start php
exec /usr/sbin/php-fpm8.2 -F
