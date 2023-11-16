#!/bin/bash

# create user
useradd -d /var/www/wordpress -p $(echo ${FTP_PASSWORD} | openssl passwd -1 -stdin) ${FTP_USER}

# sub env variables in conf file
if test -f /etc/vsftpd.chroot_list.template
then
	envsubst '$FTP_USER' < /etc/vsftpd.chroot_list.template > /etc/vsftpd.chroot_list
fi

# launch vsftpd in foreground
vsftpd
