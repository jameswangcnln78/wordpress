#!/bin/bash

[[ ${DEBUG} == true ]]&&set -x

DIR_NAME=$(pwd)/backup/$(date +%s)
mkdir -p $DIR_NAME

echo "backup /var/www/html to $DIR_NAME ......"
sudo docker run --rm --volumes-from wordpress \
    -v $DIR_NAME:/backup wordpress tar zcvf /backup/wordpress.tar.gz /var/www/html

echo "backup database to $DIR_NAME ......"
sudo docker exec -i mysql \
    mysqldump -uroot -pexample wordpress > $DIR_NAME/mysql.sql



