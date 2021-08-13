#!/usr/bin/env bash

#set nginx home directory ./niginx/conf/nginx.conf

sudo killall chibi-scheme 

sudo killall nginx

sed -i '/.*set \$rtdir.*/c\set $rtdir '"$(pwd)"';' $(pwd)/nginx/conf/nginx.conf

sudo $(pwd)/nginx/sbin/nginx -c $(pwd)/nginx/conf/nginx.conf

./socket


