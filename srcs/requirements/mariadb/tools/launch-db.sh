#!/bin/bash

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
    service mysql start;
    
    echo "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" > inception.sql
    echo "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" >> inception.sql
    echo "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" >> inception.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" >> inception.sql
    echo "FLUSH PRIVILEGES;" >> inception.sql
    
    mysql -u root -p"${SQL_ROOT_PASSWORD}" < inception.sql
    chmod 777 /var/lib/mysql/$SQL_DATABASE
    mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
fi

mysqld_safe
