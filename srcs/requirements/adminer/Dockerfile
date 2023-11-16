FROM debian:bookworm
RUN apt update && apt upgrade \
	&& apt install wget \
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
RUN wget 'https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php'
RUN mkdir -p /var/www/adminer
RUN mv adminer-4.8.1.php /var/www/adminer/adminer.php
RUN chown -R www-data:www-data /var/www/adminer
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
