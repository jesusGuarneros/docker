Docker Compose

    son aplicaciones multicontenedor.

    contenedores

    imagenes

    volumenes

    redes

## Instalacion de docker compose

https://docs.docker.com/compose/install/


## Docker compose

**El archivo debe de tener el nombre y terminacion .yml** 

***Debe de tener:***

version: 

services:


docker-compose up -d    => se da de alta el servicio de docker-compose



//se crea una red automatica, ya que no se le definio una:

Creating network "dockercompose_default" with the default driver
Creating nginxcompose ... done


//se elimina la red, el contenedor:

docker-compose down

## Ejemplo 1:

```
//se asigna la version
version: '3'
//se asignan los servicios que se ocupan 
services:
//el tipo de servicios 
web:
//nombre del contenedor
container_name: nginxcompose
//puerto por el que va a correr
ports:

    - 8080:80
//uso de la imagen de nginx
image: nginx
```

## Ejemplo de variables de entorno

variables de entorno declaradas en el mismo archivo: enviroment: ""se insertan las variables de entorno""

```
version: '3'
services:
  db:
    image: mysql:5.7
    container_name: mysqlcompose
    ports:
     -"3306:3306"
//se declaran las variables de entorno
    enviroment:
     "MYSQL_ROOT_PASSWORD=123456"

```

## Ejemplo de variables de entorno 1

variables de entorno declaradas en diferente archivo : common.env 


revision simplemente con un 

    docker exec -ti mysqlcompose bash

    mysql -u root -p123456

```
version: '3'
services:
  db:
    image: mysql:5.7
    container_name: mysqlcompose
    ports:
     -"3306:3306"
//se declaran las variables de entorno
    enviroment:
     "MYSQL_ROOT_PASSWORD=123456"

```
