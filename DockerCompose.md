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

## Docker ejemplo de volumen :

se declara el volumen y se usa denominado vol2   con direccion a la carpeta que se desea mapear, en este caso es  /usr/share/nginx/html.

el contenedor aunque se elimine y se recree de nuevo, utilizara el volume previamente creado.

```
version: '3'
services: 
  web: 
    container_name: nginxcompose
    ports:
     - 8080:80
    volumes:
      - "vol2:/usr/share/nginx/html"
    image: nginx

volumes:
  vol2:
```

## docker ejemplo de volumen 1:

se mapea desde la carpeta en anfitrion => hacia la carpeta del contenedor.

/home/jesusGuarneros/docker-compose/html : /usr/share/nginx/html

```
version: '3'
services: 
  web: 
    container_name: nginxcompose
    ports:
     - 8080:80
    volumes:
      - "/home/jesusGuarneros/docker-compose/html:/usr/share/nginx/html"
    image: nginx
```

## Docker compose redes.

Se  pueden agregar redes con la propiedad de networks, Ejemplo "net-test" y posteriormente asigandola al contenedor de nginxcompose

```

version: '3'
services: 
  web: 
    container_name: nginxcompose
    ports:
     - 8080:80
    image: nginx
//se asigna la red previamente creada.
    networks:
      - net-test
//se crea la red 
networks:
  net-test:

```

## Ejemplo compuesto usando una red en dos contenedores, con la finalidad que haya coneccion entre ellos.

```
version: '3'
services: 
  web: 
    container_name: apachecompose
    ports:
     - 8080:80
    image: httpd
    networks:
      - net-test
  web2: 
    container_name: apachecompose1
    ports:
     - 8081:80
    image: httpd
    networks:
      - net-test   
networks:
  net-test:

```


## Ejemplo de creacion de imagen desde docker compose.

se crea un build referente al dockerfile que se encuentra en la misma carpeta. 

    compilandolo con el comando ""docker-compose build""

    posteriormete se utiliza el comando "docker-compose up -d"" para compilar el archivo normal

```
version: '3'
services: 
  web: 
    container_name: nginxcompose
    ports:
     - 8080:80
    image: web-test
    build: .
```


## Dockerfile con diferente nombre

se crea un build referente al dockerfile1 que se encuentra en la misma carpeta.

    compilandolo con el comando ""docker-compose build""

    posteriormete se utiliza el comando "docker-compose up -d"" para compilar el archivo normal

```
version: '3'
services: 
  web: 
    container_name: nginxcompose
    ports:
     - 8080:80
    image: web-test
    build: Dockerfile1
```
