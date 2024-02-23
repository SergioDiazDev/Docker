DATA = /home/sdiaz-ru/data
WORDPRESS = /home/sdiaz-ru/data/wordpress
MARIADB = /home/sdiaz-ru/data/mariadb


all: start

init:
	mkdir -p $(DATA) $(WORDPRESS) $(MARIADB)

start: init
		docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down

clean:
	rm -fr $(DATA)

.PHONY: all init start stop clean 