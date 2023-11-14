#!/bin/bash

# create certificates
mkdir -p /etc/nginx/$CERTS_
openssl req -x509 -noenc -out /etc/nginx/$CERTS_/inception.crt \
	-keyout /etc/nginx/$CERTS_/inception.key \
	-subj "/C=IT/ST=Lazio/L=Roma/O=42/OU=trinity/CN=$DOMAIN_NAME/UID=gpanico" 2> /dev/null

# check if nginx.conf.template exists and substitutes env variables in it
if test -f /etc/nginx/conf.d/nginx.conf.template
then
	envsubst '$CERTS_ $DOMAIN_NAME' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/nginx.conf
	rm /etc/nginx/conf.d/nginx.conf.template
fi
exec nginx -g "daemon off;"
