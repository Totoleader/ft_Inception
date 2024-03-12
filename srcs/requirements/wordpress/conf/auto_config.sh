#!/bin/bash

if ! [ -f /var/www/wordpress/wp-config.php ]; then

sleep 10

cd /var/www/wordpress

wp config create	--allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb \
                    --path='/var/www/wordpress'

wp core install     --allow-root \
                    --url=$URL \
                    --title=$SQL_DATABASE   \
                    --admin_user=$SQL_USER \
                    --admin_password=$SQL_PASSWORD \
                    --admin_email=$SQL_EMAIL

wp user create $WP_USER $WP_EMAIL \
                    --allow-root \
                    --role=editor \
                    --user_pass=$WP_PASSWORD
fi

mkdir -p /run/php
echo "Wordpress ready!"
/usr/sbin/php-fpm7.3 -F
