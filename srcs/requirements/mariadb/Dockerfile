FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install bash -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/launch-db.sh usr/local/bin/launch-db.sh
RUN chmod 755 usr/local/bin/launch-db.sh
RUN bash usr/local/bin/launch-db.sh