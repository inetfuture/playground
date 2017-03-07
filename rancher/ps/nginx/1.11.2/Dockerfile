FROM docker.quncrm.com/base/ubuntu:14.04
MAINTAINER Jerome Ge <jeromege@augmentum.com.cn>

ENV OPENRESTY_VERSION 1.11.2.1
ADD config/openresty_${OPENRESTY_VERSION}-1_amd64.deb /tmp/openresty_${OPENRESTY_VERSION}.deb

RUN apt-install unzip libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential

WORKDIR /tmp/
RUN dpkg -i openresty_${OPENRESTY_VERSION}.deb

COPY config/mime.types /etc/nginx/mime.types
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/proxy_params /etc/nginx/proxy_params
COPY config/fastcgi_params /etc/nginx/fastcgi_params
COPY config/basic.conf /etc/nginx/basic.conf
COPY config/h5bp /etc/nginx/h5bp
COPY config/start.sh /etc/service/nginx/run

RUN chmod +x /etc/service/nginx/run /etc/init.d/nginx \
    && rm -rf /tmp/* \
    && rm -rf /etc/nginx/sites-enabled/default

EXPOSE 80 443
