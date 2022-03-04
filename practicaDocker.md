# Creacion de imagen:

## En esta practica se instala con centos y se instala apache:

###### Se instala la imagen de centos o cualquier otro sistema operativo  (se puede especificar la version o se instala la ultima).

FROM  centos

###### se instala apache de forma en la que se instala en centos (varia deacuerdo a los diferentes sistemas operativos): se instala una capa ""

RUN yum install httpd -y

###### se introduce el CMD para que no se salga del proyecto cuando se esta ejecutando la img(comando del contenedor))

CMD apachectl -DFOREGROUND

###### COPY/ADD

    se puede agregar cualquier cosa con "add" se descarga el archivo de la url y se utiliza //copy se utiliza solamente para copiar 					   archivos

COPY "nombre_carpet_pasar" "direccion_del contenedor"

ADD "link_archivo" "direccion_del_contenedor"

###### ENV

variables de entorno:

// se declara contenido y pruebas es lo que se ira guardado en la variable.

ENV contenido pruebas

//se pasa contenido en el nuevo archivo llamado pruebas.html

RUN echo "$contenido" > /var/www/html/pruebas.html

###### WORKDIR

directorio actual en el cual se esta trabajando.

###### EXPONSE

se expone el puerto con el que se va a trabajar.

EXPONSE:81

## Ejemplo de Docker file con ubuntu

###### Se instala la imagen de ubuntu o cualquier otro sistema operativo  (se puede especificar la version o se instala la ultima).

FROM ubuntu

###### se instala apache de forma en la que se instala en ubuntu (varia deacuerdo a los diferentes sistemas operativos): se instala una capa.

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y update

RUN DEBIAN_FRONTEND="noninteractive" apt-get install apache2 -y
