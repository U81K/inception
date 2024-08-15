all: build up

build:
	mkdir -p data/wordpress_vol
	mkdir -p data/mariadb_vol
	cd srcs && docker-compose build

up:
	cd srcs && docker-compose up -d

down:
	
	cd srcs && docker-compose down

clean: down
	rm -rf data

fclean: clean
	cd srcs && docker-compose down --rmi all