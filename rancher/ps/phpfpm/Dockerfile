# Aug base phpfpm 7.1 docker image
# Image name: docker.quncrm.com/base/phpfpm:7.1

FROM docker.quncrm.com/base/phpcli:7.1
MAINTAINER Jerome Ge <jeromege@augmentum.com.cn>

RUN apt-install php7.1-fpm
RUN mkdir -p /etc/service/php7.1-fpm /var/log/php7/

COPY conf/php.ini /etc/php/7.1/fpm/php.ini
COPY conf/www.conf /etc/php/7.1/fpm/pool.d/www.conf
COPY conf/start.sh /etc/service/php7.1-fpm/run

RUN phpenmod mongodb \
    && phpenmod grpc
RUN chmod +x /etc/service/php7.1-fpm/run

EXPOSE 9000
