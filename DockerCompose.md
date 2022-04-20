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
//asi se llamara la imagen que se compilara con build por el docker file
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
//asi se llamara la imagen que se compilara con build por el docker file
    image: web-test
    build: Dockerfile1
```

## Docker cambiar el cmd.

con la propiedad command se redirecciona el cmd cambiandolo por los diferentes valores

```

version: '3'
services: 
  web: 
    container_name: nginxcompose
    ports:
     - 8080:80
    image: web-test
    command: python -m SimpleHTTPServer 8080
    build: Dockerfile1
```

## Limitando contenedores con docker-compose

```
version: '3'
services: 
  web: 
    container_name: nginxcompose
//se limita la memoria y el cpu a utilizar.
    mem_limit: 20m
    cpuset: "0"
    ports:
     - 8080:80
    image: nginx
```

## Condiciciones y politicas de docker

| Flag                                                                      | Description                                                                                                                                                                                                                                                                                                                 |
| ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `no (nunca lo reinicies))`                                              | Do not automatically restart the container. (the default)                                                                                                                                                                                                                                                                   |
| `on-failure[:max-retries] (reinicia a menos de que haya alguna falla))` | Restart the container if it exits due to an error, which manifests as a non-zero exit code.  Optionally,limit the number of times the Docker daemon attempts to restart the container using the `:max-retries`option.                                                                                                     |
| `always (siempre reinicialo))`                                          | Always restart the container if it stops. If it is manually stopped, it is restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in[restart policy detail](https://docs.docker.com/config/containers/start-containers-automatically/#restart-policy-details) |
| `unless-stopped(reinicia al menos que yo lo ahya pededid))`             | Similar to `always`, except that when the container is stopped (manually or otherwise), it is not restarted even after Docker daemon restarts.                                                                                                                                                                            |

## nombre del proyecto en docker compose

    docker-compose -p webtest -f docker-compose-cmd.yml up -d

## nombre del proyecto en docker compose

forma en la cual se puede compilar un docker compose con diferente nombre, asignandole la variable de -f y enseguida el nombre.

    docker-compose -f docker-compose-msyql.yml up -d

## Docker compose y wordpress.

#se crea el contenedor  para la base de datos llamado ""wp-mysql"" utilizando y guardando la informacion en el directorio actual en una carpeta llamada data asignadole variables de entorno para el uso de la base de datos.

#se crea el contenedor para wordpress llamado ""wp-web"" utilizando y guardando la informacion en el directorio actual en una carpeta llamada html,  asignadole variables de entorno para usar el servicio de db (contenedor wb-mysql).

#se crea una red llamada my_net y se asigna a los dos servicios.

```
version: '3'

services:
  db:

    container_name: wp-mysql
    image: mysql:5.7
    volumes:
       - $PWD/data:/var/lib/mysql
    environment:
       MYSQL_ROOT_PASSWORD: 12345678
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
    ports:
      - "3306:3306"
    networks:
      - my_net

  wp:
    container_name: wp-web
    volumes:
      - "$PWD/html:/var/www/html"
    depends_on:
      - db
    image: wordpress
    ports:
      - "9091:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
    networks:
      - my_net
networks:
  my_net:
```

## Docker compose y drupal.

#se crea una red llamada my_net y se asigna a los dos servicios.

```
version: '3'
services:
  drupal:
    volumes:
      - drupal:/var/www/html
    image: drupal:8-apache
    ports:
      - "8080:80"
    networks:
      - net
  postgres:
    image: postgres:10
    environment:
      POSTGRES_PASSWORD: example
    volumes:
      - $PWD/data:/var/lib/postgresql/data
    networks:
      - net
volumes:
  drupal:
networks:
  net:
```

## Docker compose y prestashop.

#se crea una red llamada my_net y se asigna a los dos servicios.

#se declara un servicio de la base de datos. que declara un contenedor :"ps-web"

#se declara un servicio llamado ps  que declara un contenedor :"ps-web"

```
version: '3'

services:
  db:
    container_name: ps-mysql
    image: mysql
    volumes:
       - $PWD/data:/var/lib/mysql
    environment:
       MYSQL_ROOT_PASSWORD: 12345678
       MYSQL_DATABASE: ps
       MYSQL_USER: ps
       MYSQL_PASSWORD: ps
    ports:
      - "3306:3306"
    networks:
      - my_net

  ps:
    container_name: ps-web
    volumes:
      - "$PWD/html:/var/www/html"
    depends_on:
      - db
    image: prestashop/prestashop
    ports:
      - "9090:80"
    environment:
      DB_SERVER: db
      DB_USER: ps
      DB_PASSWD: ps
      DB_NAME: ps
    networks:
      - my_net
networks:
  my_net:
```


## Docker registry:
