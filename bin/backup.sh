#!/bin/bash
if ! [ -e wp-content ];then
    mkdir wp-content
fi
sudo docker cp wordpress:/var/www/html/wp-content/plugins wp-content
sudo docker cp wordpress:/var/www/html/wp-content/themes wp-content
