FROM debian:bullseye

ENV NETWORK=inception


RUN apt-get update
RUN apt-get install -y nginx

#Limpiar cache apt
RUN rm -rf /var/lib/apt/lists/*


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]