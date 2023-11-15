FROM debian:bookworm
RUN apt-get update && apt-get upgrade \
	&& apt-get install mariadb-server -y
COPY ./tools/script.sh /etc/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
