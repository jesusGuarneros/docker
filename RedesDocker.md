## Red por defecto en docker

***red por defecto se llama bridge.***

***=>>** *se verifica la ip de docker.

***ip a | grep docker***

    172.17.0.1/16

=> cuando se crea un contenedor se asigna una red deacuerdo a la ip de docker.

==> Docker red por defecto.

** *docker  network ls***

    docker network inspect bridge

dodcker inspect ""nombre_Contenedor""

=> se puede realizar respuesta o un ping entre contenedores entre la misma red.

docker exec ""nombre_contenedor"" bash -c "ping 10.66.33.1"

## Red definida por el usuario.

driver bridge.

=>creando una red

docker network create "test-network"

=>utilizando y creando una red llamada docker-test-network, con bridge

docker network create -d bridge --172.124.10.0/24 --gateway 172.124.10.1 docker-test-network

vizualizando red

docker network inspect docker-test-network |less

## Red distinta al contenedor de Docker.

=>contenedor para que no se muera.

docker run -dti --name test1 centos

=> conectar a un contenedor que se hizo previamente

    docker run --network docker-test-network -d  --name test3 -ti centos

    docker inspec test3

## conectar Contenedores en la misma Red

Al crear un contenedor podemos ver los contenedores por su nombre:

=>se crean dos contenedores bajo centos.

    docker run --network docker-test-network -d  --name test5 -ti centos =>EJEMPLO IP  192.168.1.25

    docker run --network docker-test-network -d  --name test6 -ti centos => EJEMPLO IP  192.168.1.26

=>FORMA DE CONECTAR IP  o por nombre

    docker exec test5 bash -c "ping 192.168.1.26" o docker exec test5 bash -c "ping test6"

No se puede realizar el ping por nombre en la red de docker ya que no acepta pings por nombre.

## conectar Contenedores a distinta red

docker network connect

test5 y test6 se encuentran en la misma red llamada docker-test-network.

=>con esta sentencia conectamos al contenedor 7 a la misma red que test5 y test6

docker network connect docker-test-network test7

simplemente se adjunta la red, no se elimina la que se tenia.

=> elimina la red que se le habia agregado (docker-test-network)

docker network disconnect docker-test-network test7

## Eliminar una red.

=> No se deben de tener contenedores conectados a la red.

docker rm -fv test7 => se elimina el contenedor

docker network rm docker-test-network => se elimina la red

## Definir ip a un contenedor:

docker run --network docker-test-network --ip 192.168.1.80 -d  --name test8 -ti centos


Definir una red nonea un contenedor:



docker run --network none  -d  --name test8 -ti centos
