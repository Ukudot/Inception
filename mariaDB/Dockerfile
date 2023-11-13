FROM debian:bookworm
RUN apt-get update && apt-get upgrade \
	&& apt-get install mariadb-server -y
COPY ./tools/script.sh /etc/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ENV MARIADB_DATABASE=test
ENV MARIADB_USER=user
ENV MARIADB_USER_PASSWORD=password
ENV MARIADB_ROOT_PASSWORD=password
ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
