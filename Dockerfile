FROM  centos:7

RUN yum install httpd -y

COPY prueba /var/www/html

CMD apachectl -DFOREGROUND