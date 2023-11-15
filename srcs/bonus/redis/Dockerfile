FROM debian:bookworm
COPY ./tools/script.sh /etc/script.sh
RUN apt-get update && apt-get upgrade
RUN apt-get install lsb-release \
	curl \
	gpg -y
ENTRYPOINT ["/bin/bash", "/etc/script.sh"]
