FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
        && apt-get install -y \
        wget \
        php7.3 \
        php-fpm \
        php-mysql \
        mariadb-client
        # sendmail

#version?
RUN wget https://wordpress.org/wordpress-6.3.tar.gz -P /var/www \
    && cd /var/www && tar -xzf wordpress-6.3.tar.gz && rm wordpress-6.3.tar.gz \
    && chown -R root:root /var/www/wordpress \
    && chmod -R 777 /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /usr/bin/auto_config.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN chmod 777 /usr/bin/auto_config.sh


EXPOSE 9000

ENTRYPOINT ["/usr/bin/auto_config.sh"]