FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt install bash -y \
    && apt-get install mariadb-server -y 

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/launch-db.sh /var/lib/mysql/launch-db.sh
RUN chmod 777 /var/lib/mysql/launch-db.sh
EXPOSE 3306

ENTRYPOINT ["/var/lib/mysql/launch-db.sh"]