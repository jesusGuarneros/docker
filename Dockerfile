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



CMD apachectl -DFOREGROUND