ENV				= ./srcs/.env
HOST			= gpanico.42.it
VOL_MARIADB		= /home/gpanico/data/mariadb
VOL_WORDPRESS	= /home/gpanico/data/wordpress
VOL_ADMINER		= /home/gpanico/data/adminer
DOCKER_COMPOSE 	= srcs/docker-compose.yml

list_volumes = $(shell docker volume ls -q)
list_images = $(shell docker images -q)

up: create_dir host
	docker compose -f ${DOCKER_COMPOSE} --env-file ${ENV} up

clean_up: create_dir clean host
	docker compose -f ${DOCKER_COMPOSE} --env-file ${ENV} up

host:
	@if ! grep -q "${HOST}" /etc/hosts; \
	then echo "127.0.0.1 ${HOST}" >> /etc/hosts; \
		echo "host created"; \
	else echo "hostname already registered"; \
	fi

create_dir:
	@if ! test -f $(VOL_MARIADB); \
	then \
	mkdir -p $(VOL_MARIADB); \
	fi
	@if ! test -f $(VOL_WORDPRESS); \
	then \
	mkdir -p $(VOL_WORDPRESS); \
	fi
	@if ! test -f $(VOL_ADMINER); \
	then \
	mkdir -p $(VOL_ADMINER); \
	fi

clean_host:
	@sed -i "s/.*${HOST}.*//" /etc/hosts

down:
	@docker compose -f ${DOCKER_COMPOSE} down

clean_volumes:
	@if [ -n "$(list_volumes)" ]; \
	then \
	docker volume rm $(list_volumes); \
	fi

dclean_volumes: clean_volumes
	rm -rf ${VOL_MARIADB}/*
	rm -rf ${VOL_WORDPRESS}/*
	rm -rf ${VOL_ADMINER}/*


clean_images:
	@if [ -n "$(list_images)" ]; \
	then \
	docker rmi $(list_images); \
	fi

clean: down clean_images

fclean: clean clean_host dclean_volumes
	@docker system prune -af
