FROM debian:bookworm
RUN apt-get update && apt-get upgrade \
	&& apt-get install nginx -y \
	&& apt-get install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -noenc -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj '/C=IT/ST=Lazio/L=Roma/O=42/OU=trinity/CN=gpanico.42.it/UID=gpanico'
