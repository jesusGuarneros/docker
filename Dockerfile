FROM  centos:7

RUN yum install httpd -y

WORKDIR /var/www/html

COPY prueba .

ENV contenido pruebas

RUN echo "$contenido" > /var/www/html/pruebas.html

EXPOSE 8080

CMD apachectl -DFOREGROUND