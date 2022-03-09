# Creacion de una imagen con centos utilizando apache y php

### se utiliza la estructura basica de Docker (FROM RUN CMD)

FROM centos:7

RUN yum -y install httpd php php-cli php-common

RUN echo "`<?php phpinfo(); ?>`" > /var/www/html/hola.php

CMD apachectl -DFOREGROUND

### Creacion de openssl https

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout docker.key -out docker.crt


### configuracion del archivo ssl.conf para el uso del certificado ssl

<VirtualHost *:443>

    ServerName localhost

    DocumentRoot /var/www/html

    SSLEngine on

    SSLCertificateFile /docker.crt

    SSLCertificateKeyFile /docker.key

</VirtualHost>
