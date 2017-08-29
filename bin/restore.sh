#!/bin/bash

[[ ${DEBUG} == true ]]&&set -x

DIR_NAME=$(pwd)/backup/$1

echo "restore data form $DIR_NAME ......"
sudo docker run --rm --volumes-from wordpress \
    -v $DIR_NAME:/backup wordpress tar xzvf /backup/wordpress.tar.gz -C /
sudo docker exec -i mysql \
    mysql -uroot -pexample wordpress < $DIR_NAME/mysql.sql



