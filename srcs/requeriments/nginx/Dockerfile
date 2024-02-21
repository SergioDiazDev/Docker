FROM debian:bullseye


#Update
RUN apt-get update
#Nginx
RUN apt-get install -y nginx
#OpenSSL
RUN	apt install -y openssl

#Generate SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -sha256 -nodes \
	-days 42 -newkey rsa:4096 \
	-out /etc/nginx/ssl/inception.crt \
	-keyout  /etc/nginx/ssl/inception.key \
	-subj "/C=ES/ST=Andalucia/L=Malaga/O=42/OU=42/CN=sdiaz-ru.42.fr/UID=sdiaz-ru"

RUN mkdir -p /var/run/nginx

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

#Limpiar cache apt
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]