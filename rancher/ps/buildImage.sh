#!/bin/bash

cd nginx

docker build -t inetfuture.com/tests/openresty:latest 1.11.2
docker push inetfuture.com/tests/openresty:latest

cd -

cd phpfpm

docker build -t inetfuture.com/tests/phpfpm:7.1 .
docker push inetfuture.com/tests/phpfpm:7.1

cd -

cd docker/nginx

docker build -t inetfuture.com/tests/php-nginx:latest .
docker push inetfuture.com/tests/php-nginx:latest

cd -

docker build -f docker/Dockerfile -t inetfuture.com/tests/php-server:latest .
docker push inetfuture.com/tests/php-server:latest
