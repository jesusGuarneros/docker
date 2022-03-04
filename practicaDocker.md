# Creacion de imagen:

## En esta practica se instala con centos y se instala apache:

###### Se instala la imagen de centos o cualquier otro sistema operativo  (se puede especificar la version o se instala la ultima).

FROM  centos

###### se instala apache de forma en la que se instala en centos (varia deacuerdo a los diferentes sistemas operativos): se instala una capa ""

RUN yum install httpd -y

###### se introduce el CMD para que no se salga del proyecto cuando se esta ejecutando la img

CMD apachectl -DFOREGROUND

## Ejemplo de Docker file con ubuntu


###### Se instala la imagen de ubuntu o cualquier otro sistema operativo  (se puede especificar la version o se instala la ultima).

FROM ubuntu

###### se instala apache de forma en la que se instala en ubuntu (varia deacuerdo a los diferentes sistemas operativos): se instala una capa.


RUN DEBIAN_FRONTEND="noninteractive" apt-get -y update

RUN DEBIAN_FRONTEND="noninteractive" apt-get install apache2 -y
