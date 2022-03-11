##### Declaramos la img que se usara

FROM centos:7

##### Se copia la configuracion de nginx

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

##### se instala nginx y repositorio de ius centos 7 y php

RUN yum -y install nginx --enablerepo=nginx &&\

    yum -y install https://centos7.iuscommunity.org/ius-release.rpm &&\

    yum -y install \

    php71u-fpm \

    php71u-cli \

    php71u-mysqlnd \

    php71u-soap \

    php71u-xml \

    php71u-zip \

    php71u-json \

    php71u-mcrypt \

    php71u-mbstring \

    php71u-zip \

    php71u-gd \

    --enablerepo=ius && yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY ./bin/start.sh /start.sh
