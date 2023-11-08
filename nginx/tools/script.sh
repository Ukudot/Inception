#!/bin/bash
mkdir -p /etc/nginx/$CERTS_
openssl req -x509 -noenc -out /etc/nginx/$CERTS_/inception.crt \
	-keyout /etc/nginx/$CERTS_/inception.key \
	-subj "/C=IT/ST=Lazio/L=Roma/O=42/OU=trinity/CN=$CERTS_/UID=gpanico"
envsubst /etc/nginx/conf.d/nginx.conf.template /etc/nginx/conf.d/nginx.conf
exec nginx -g daemon off;
