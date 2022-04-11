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
