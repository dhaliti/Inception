
HOME=/home/dhaliti

all: init build up
	
init:
	mkdir -p $(HOME)/data/mariadbvol
	mkdir -p $(HOME)/data/wordpressvol
	sed -i "s/localhost/dhaliti.42.fr/g" /etc/hosts
	
build:
	docker-compose -f ./srcs/docker-compose.yml build --no-cache --pull

up: 
	docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

down:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: down
		docker system prune -a
		sudo rm -rf $(HOME)/data

re: fclean all
	

