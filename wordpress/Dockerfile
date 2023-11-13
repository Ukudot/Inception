FROM debian:bookworm
RUN apt update && apt upgrade \
	&& apt install wget \
	unzip \
	php \
	php-curl \
	php-fpm \
	php-bcmath \
	php-gd \
	php-soap \
	php-zip \
	php-curl \
	php-mbstring \
	php-mysqlnd \
	php-gd \
	php-xml \
	php-intl \
	php-zip -y
COPY ./tools/script.sh /etc/script.sh
RUN wget 'https://it.wordpress.org/wordpress-6.4.1-it_IT.zip'
RUN unzip 'wordpress-6.4.1-it_IT.zip' -d /var/www
RUN chown -R www-data:www-data /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar
ENV SQL_DATABASE="test"
ENV SQL_USER="user"
ENV SQL_PASSWORD="password"
ENV DOMAIN_NAME="gpanico.42.it"
ENV WP_TITLE="blog"
ENV WP_ADMIN="admin"
ENV WP_ADMIN_PASSWORD="admin"
ENV WP_ADMIN_EMAIL="admin@gmail.com"
ENV WP_USER="user"
ENV WP_USER_EMAIL="user@gmail.com"
ENV WP_USER_PASSWORD="user"
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
EXPOSE 9000:9000
ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
