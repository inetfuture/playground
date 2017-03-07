#!/bin/bash

cd nginx

docker build -t docker.quncrm.com/tests/openresty:latest 1.11.2
docker push docker.quncrm.com/tests/openresty:latest

cd -

cd docker/nginx

docker build -t docker.quncrm.com/tests/php-nginx:latest .
docker push docker.quncrm.com/tests/php-nginx:latest

cd -

docker build -f docker/Dockerfile -t docker.quncrm.com/tests/php-server:latest .
docker push docker.quncrm.com/tests/php-server:latest
