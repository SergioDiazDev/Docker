FROM debian:bullseye

ENV NETWORK=inception

#Install Utils
RUN apt-get update
RUN apt-get install -y apt-utils

#Install MariaDB
RUN apt-get install -y mariadb-server

#RM Cache apt
RUN rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init_MariaDB.sh /

RUN chown mysql:mysql /etc/mysql/my.cnf

#RUN service mariadb stop
RUN service mariadb start

EXPOSE 3306

#CMD ["mysqld"]
