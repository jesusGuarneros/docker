# Creacion de una imagen con centos copiando archivos a la ruta de apache

FROM  centos:7

LABEL version=1.0

LABEL description="es una imagen de prueba"

RUN yum install httpd -y

COPY prueba /var/www/html

RUN echo "$(whoami)" > /var/www/html/user1.html

RUN useradd jesus

RUN chown jesus /var/www/html

USER jesus

RUN echo "$(whoami)" > /tmp/user2.html

USER root

RUN cp /tmp/user2.html /var/www/html/user2.html

COPY run.sh /run.sh

CMD sh /run.sh

# creacion de una imagen con nginx: utilizando conceptos base


FROM  nginx

RUN useradd jesus

COPY prueba /usr/share/nginx/html

ENV archivo docker

WORKDIR /usr/share/nginx/html

RUN echo "$archivo" > /usr/share/nginx/html/env.html

EXPOSE 90

LABEL version=1

USER jesus

RUN echo "yo soy $(whoami)" > /tmp/yo.html

USER root

RUN cp /tmp/yo.html /usr/share/nginx/html/docker.html

VOLUME /var/log/nginx

CMD nginx -g 'daemon off;'

```

```
