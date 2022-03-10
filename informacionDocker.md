# Comandos de Docker:

###### Vizualiza las imagenes que se tienen descargadas y/o creadas:

sudo docker images

###### vizualiza los contenedores que se encuentran corriendo:

sudo docker ps -a

###### Compilacion del DOCKERFILE

sudo docker build -t apache .

###### corre y/o crea un contenedor

sudo docker run -d apache-centos

###### vizualiza el historial de un contenedor

sudo docker history -H apache-centos:apache-cmd

###### borra algun contenedor deacuerdo al nombre:

sudo docker rm -fv dreamy_neumann

sudo docker rm -f dreamy_neumann

###### corre un contenedor asigandole el nombre "apache" utilizando la imagen "apache-centos" utilizando la version "apache-cmd"

sudo docker run -d --name apache apache-centos:apache-cmd

###### corre un contenedor asigandole el nombre "apache1" utilizando la imagen "apache-centos" utilizando la version "apache-cmd" utiliznado de salida del ordenador el puerto 80 y de la imagen el puerto 80.

sudo docker run -d --name apache1 -p 80:80  apache-centos:apache-cmd

###### STOP. START. PAUSE en contenedores

sudo docker pause "name del contenedor"

sudo docker stop "name del contenedor"

sudo docker start "name del contenedor"

###### Eliminar una imagen especifica:

sudo docker rmi a7029688a460 0513f9d550a4

###### Hacer Imagen que no sea de Docker

se compila de la misma forma. especificando el nombre. Con diferencia de que se agrega -f ""Nuevo Dockerfile"" y finaliza con un punto.

sudo docker build -t test -f NuevoDockerfile .

###### Dangling Images

docker images -f dangling dangling=true

sudo docker images -f dangling=true -q 

sudo docker iamges -f dangling=true -q ! xargs docker rmi
