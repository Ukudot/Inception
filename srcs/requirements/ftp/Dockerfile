FROM debian:bookworm
RUN apt-get update && apt-get upgrade
RUN apt-get install vsftpd \
	gettext  -y
RUN mkdir -p /var/run/vsftpd/empty
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./conf/vsftpd.chroot_list.template /etc/vsftpd.chroot_list.template
COPY ./tools/script.sh ./etc/script.sh
ENTRYPOINT ["/bin/bash", "./etc/script.sh"]
