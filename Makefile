ENV	= .env
HOST	= gpanico.42.it

all:
	docker compose --env_file=${ENV} up

host:
	@if grep -q "${HOST}" /etc/hosts; \
	then echo "127.0.0.1 ${HOST}" >> /etc/hosts; \
		echo "host created"; \
	else echo "hostname already registered"; \
	fi

clear_host:
	@sed -i "s/.*${HOST}.*//" /etc/hosts
