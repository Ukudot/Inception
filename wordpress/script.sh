apt update && apt upgrade
apt install wget unzip -y

# testing purpose
apt install nginx

# install php
apt install php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip -y

# start php
service php8.2-fpm start

# download wordpress
wget 'https://it.wordpress.org/wordpress-6.4.1-it_IT.zip'
unzip 'wordpress-6.4.1-it_IT.zip' -d /var/www/html
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/nome_del_database_qui/inception_db/" wp-config.php
sed -i "s/nome_utente_qui/username/" wp-config.php
sed -i "s/password_qui/password/" wp-config.php
sed -i "s/'DB_HOST', 'localhost'/'DB_HOST', 'mariadb:3306'/" wp-config.php
chown -R www-data:www-data /var/www/html/wordpress/
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp-cli.phar
