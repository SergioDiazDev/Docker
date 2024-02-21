FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wordpress
RUN apt-get install -y wget curl php7.3 php-fpm php-mysql mariadb-client

RUN wget https://es.wordpress.org/wordpress-6.4.3-es_ES.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.4.3-es_ES.tar.gz && rm wordpress-6.4.3-es_ES.tar.gz

COPY conf/pool.d /etc/php/7.4/fpm/pool.d
COPY conf/www.conf /etc/php/7.4/fpm/www.conf
COPY tools/auto_config.sh /auto_config.sh

# Dar permisos de ejecución al script
RUN chmod +x /auto_config.sh

# Crear directorio para PHP-FPM
RUN	useradd sdiaz-ru && groupadd inception && usermod -aG inception sdiaz-ru

RUN mkdir -p /var/run/
# Indicar el puerto en el que se ejecutará PHP-FPM (puerto 9000)
EXPOSE 9000

# Entrypoint para ejecutar el script al iniciar el contenedor
CMD ["/auto_config.sh"]

EXPOSE 9000