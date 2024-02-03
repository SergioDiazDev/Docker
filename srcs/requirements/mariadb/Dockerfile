FROM debian:bullseye

ENV NETWORK=inception

#Install Utils
RUN apt-get update
RUN apt-get install -y apt-utils
#RM Cache apt
RUN rm -rf /var/lib/apt/lists/*

#Install MariaDB
RUN apt-get update
RUN apt-get install -y mariadb-server
#RM Cache apt
RUN rm -rf /var/lib/apt/lists/*

RUN chown mysql:mysql /etc/mysql/my.cnf

EXPOSE 3306

CMD ["mysqld"]
