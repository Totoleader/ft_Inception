FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt install nginx -y

RUN mkdir -p /etc/nginx/ssl \
    && apt install openssl -y \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=macote.42.fr/UID=macote" \
    && mkdir -p /var/run/nginx \
    && chmod -R 777 /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
