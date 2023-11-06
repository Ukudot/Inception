apt update && apt upgrade
apt install wget unzip -y

# testing purpose
apt install nginx

# install php
apt install php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip -y

# start php
service php8.2-fpm start

# download wordpress
wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html/
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
chown -R www-data:www-data /var/www/html/wordpress/
