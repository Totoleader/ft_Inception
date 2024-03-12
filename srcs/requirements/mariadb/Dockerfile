FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt-get install mariadb-server -y 

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/launch-db.sh /usr/local/bin/launch-db.sh
RUN chmod 777 /usr/local/bin/launch-db.sh
RUN chmod -R 777 /var/lib/mysql
EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/launch-db.sh"]