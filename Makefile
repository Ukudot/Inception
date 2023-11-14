ENV		 = .env
HOST	 = gpanico.42.it
USERNAME = gpanico

list_volumes = $(shell docker volume ls -q)
list_images = $(shell docker images -q)

all: clean host
	docker compose --env-file ${ENV} up

host:
	@if ! grep -q "${HOST}" /etc/hosts; \
	then echo "127.0.0.1 ${HOST}" >> /etc/hosts; \
		echo "host created"; \
	else echo "hostname already registered"; \
	fi

clean_host:
	@sed -i "s/.*${HOST}.*//" /etc/hosts

down:
	@docker compose down

clean_volumes:
	@if [ -n "$(list_volumes)" ]; \
	then \
	docker volume rm $(list_volumes); \
	fi

clean_images:
	@if [ -n "$(list_images)" ]; \
	then \
	docker rmi $(list_images); \
	fi

clean: down clean_images

fclean: clean clean_host clean_volumes
	@docker system prune -af
	rm -rf /home/gpanico/data/mariadb/*
	rm -rf /home/gpanico/data/wordpress/*
