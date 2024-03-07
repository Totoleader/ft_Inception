#!/bin/bash
sleep 10
cd /var/www/wordpress

wp config create	--allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb \
                    --path='/var/www/wordpress'

wp core install     --allow-root \
                    --url="https://localhost" \
                    --title=$SQL_DATABASE   \
                    --admin_user=$SQL_USER \
                    --admin_password=$SQL_PASSWORD \
                    --admin_email=macote@student.42quebec.com

mkdir /run/php
/usr/sbin/php-fpm7.3 -F
