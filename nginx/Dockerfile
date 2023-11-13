FROM debian:bookworm
RUN apt-get update && apt-get upgrade \
	&& apt-get install nginx -y \
	&& apt-get install openssl -y \
	&& apt-get install gettext -y
COPY conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
COPY tools/script.sh /script.sh
RUN mkdir /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
#ENV CERTS_=./ssl
#ENV DOMAIN_NAME=gpanico.42.it
ENTRYPOINT ["/bin/bash", "/script.sh"]
