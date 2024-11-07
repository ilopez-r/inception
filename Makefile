name = Inception
DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml --env-file $(HOME)/.env

all:
	@printf "Configuring ${name}...\n"
	@mkdir -p $(HOME)/data/mariadb
	@mkdir -p $(HOME)/data/wordpress
	@$(DOCKER_COMPOSE) up -d

down:
	@printf "Stopping ${name}...\n"
	@$(DOCKER_COMPOSE) down

re: down
	@printf "Building ${name} configuration...\n"
	@mkdir -p $(HOME)/data/mariadb
	@mkdir -p $(HOME)/data/wordpress
	@$(DOCKER_COMPOSE) up -d --build

clean: down
	@printf "Cleaning ${name}...\n"
	@docker system prune -a
	@sudo chmod -R 777 $(HOME)/data
	@sudo rm -rf $(HOME)/data/wordpress/* $(HOME)/data/mariadb/*

fclean: down
	@printf "Full cleaning ${name}...\n"
	@sudo chmod -R 777 $(HOME)/data
	@sudo rm -rf $(HOME)/data
	@docker system prune -a --volumes --force
	@docker network prune --force
	@docker volume prune --force

.PHONY: all down re clean fclean
