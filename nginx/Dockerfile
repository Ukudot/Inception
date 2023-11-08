FROM debian:bookworm
RUN apt-get update && apt-get upgrade \
	&& apt-get install nginx -y \
	&& apt-get install openssl -y \
	&& apt-get install gettext -y
#RUN mkdir -p /etc/nginx/ssl
#RUN openssl req -x509 -noenc -out /etc/nginx/ssl/inception.crt \
#	-keyout /etc/nginx/ssl/inception.key \
#	-subj '/C=IT/ST=Lazio/L=Roma/O=42/OU=trinity/CN=gpanico.42.it/UID=gpanico'
RUN mkdir -p /var/www/html
RUN touch /var/www/html/index.html
RUN echo '<h1>Html bello</h1>' > /var/www/html/index.html
COPY conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
COPY tools/script.sh /script.sh
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
#ENTRYPOINT ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/bin/bash", "/script.sh"]
