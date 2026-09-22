LOGIN := rduport
DATA_DIR := /home/$(LOGIN)/data
COMPOSE := docker compose -f srcs/docker-compose.yml --env-file srcs/.env

all: up

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f

clean: down
	sudo rm -rf /home/rduport/data/mariadb
	sudo rm -rf /home/rduport/data/wordpress
	mkdir -p /home/rduport/data/mariadb
	mkdir -p /home/rduport/data/wordpress

fclean: clean
	$(COMPOSE) down --rmi all --volumes --remove-orphans
	docker system prune -af
