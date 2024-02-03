DIR			=	srcs/requirements/

MARIADB		=	mariadb
PORTMARIADB	=	3306:3306

NGINX		=	nginx
PORTNGINX	=	80:80

WP			=	nginx
PORTWP		=	80:80

prune:
		docker container prune -f
		docker image prune -f

mariadb:
		docker build -t $(MARIADB) $(DIR)$(MARIADB)/
		docker run -p $(PORTMARIADB) $(MARIADB)

nginx:
		docker build -t $(NGINX) $(DIR)$(NGINX)/
		docker run -p $(PORTNGINX) $(NGINX)

wordpress:
		docker build -t $(WP) $(DIR)$(WP)/
		docker run -p $(PORTWP) $(WP)
