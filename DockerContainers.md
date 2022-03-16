###### contenedor mysql

docker run -d  --name  ""nombre_contenedor"" -e "MYSQL_ROOT_PASSWORD=123456" mysql

docker logs -f "nombre_contenedor"

docker inspect "nombre del contenedor"

mysql -u root -h 10.00.15.415 -p123456  => -u es el usuario , -h  es el host done esta,=> -p es el password previamente definido

mysql -u root -h 127.0.0.1 -p123456 --port 3333

sudo docker run --name mysqlprubra -e "MYSQL_ROOT_PASSWORD=123456" -d -p 3306:3306 mysql

sudo docker exec -it mysqlprubra  bash

mysql

###### contenedor mongo

sudo docker run -d --name mongoprueba -p 27017:27017 mongo

estadisticas del contenedor:

docker stats "nombre o id contenedor"

Es importante revisar la pagina oficial de los contenedores. Utilizandso las imagenes oficiales.

###### se utiliza para ingresar  con un usuario previamente creado en una imagen a un contenedor

-u jesus


###### Limitar contenedores

docker run -d --name mongo mongo

docker stats mongo  =>se verifica el status del contenedor. 

docker run -d -m ""500mb"" --name mongo2 mongo   =>se limita la memoria ram que se utiliza  en mb

docker run -d -m ""500gb"" --name mongo2 mongo   =>se limita la memoria ram que se utiliza  en gb


grep ""model name"" /proc/cpuinfo \\\\ wc-l

docker run -d -m ""500mb"" --cpuset-cpus 0-1 --name mongo2 mongo

=>se limita la los cpu que se utiliza con --cpuset-cpus 0-2.
