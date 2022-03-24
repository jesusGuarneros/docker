# VOLUMENES

los volumenes permiten almacenar data persistente del contenedor.

    ya que si el contenedor se elimina la data se puede perder.

Volumenes de host => volumenes que se almacenan en dockerhost

volumenes anonymus => no se define una carpeta pero docker crea una carpeta

volumenes named volumes => volumnes que nosotros creamos, lo crea docker.

##### Como crear un volumen de host.

sudo docker run -d --name dbvolummmn -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=12345678" -v /Documentos/mysql/:/var/lib/mysql mysql:latest

##### crear volumenes anonimos.

sudo docker run -d --name volumanonym -v /var/lib/mysql  -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=12345678" -e "MYSQL_DATABASE=docker.db" mysql:latest

sudo docker run -d --name volumanonym -v /var/lib/mysql  -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=12345678" -e "MYSQL_DATABASE=docker.db" mysql:latest

sudo docker run -d --name volumanonym -v  /home/jesus/docker/volumes/ndslJNFADSJNF12313421E32vfadg312/_data_:/var/lib/mysql  -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=12345678" -e "MYSQL_DATABASE=docker.db" mysql:latest

##### Utilizando VOLUMENES desde DOCKERFILE.

sudo docker build -t volumen .

sudo docker run -dti  --name test volumen

docker volume ls

sudo docker exec -ti test bash

[root@a0ec398cb104 /]# cd /opt/
[root@a0ec398cb104 opt]# ll
total 0
[root@a0ec398cb104 opt]# touch file1.txt
[root@a0ec398cb104 opt]# touch file2.txt
[root@a0ec398cb104 opt]# ls
file1.txt  file2.txt
[root@a0ec398cb104 opt]# ll
total 0
-rw-r--r-- 1 root root 0 Mar 21 19:40 file1.txt
-rw-r--r-- 1 root root 0 Mar 21 19:40 file2.txt
[root@a0ec398cb104 opt]# exit

jesusguarneros@jesusguarneros-ideacentre-AIO-310-20IAP:~/Documentos/docker/fiveDocker$ sudo su
root@jesusguarneros-ideacentre-AIO-310-20IAP:/home/jesusguarneros/Documentos/docker/fiveDocker# cd /var/lib/docker/
root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker# ls
buildkit  containers  image  network  overlay2  plugins  runtimes  swarm  tmp  trust  volumes

** root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker/volumes# ls
0e56ca51c5183c9b73b8d8361a3e2d4a80f666d5f08397d98e9f198d000f90f1  a5da8eb0d84271d6af8e4e5372e620cfdde44b9b45eeb8a0146c7face0dbe3ba
0f25e8660e4f60a75880e2e2f673a8fd3fd4ae7550ec51623d3465aed124a9ea  backingFsBlockDev
2d61dd348a35c9a76302cae68a28a1c0a58b8cdcbebc2459cc89e5db5a594fd6  d0a56e8b0326a45036106ac09ec7b5094f991ebad7e08de738f53490a2172d4c
3758ceb6d41e7752293b07da5ce3d49adcd7d0af4fa44d1dc4b6c9d24a33d347  d7f40e708a8c30acbe7909460d06d120c62daa8c5a53b8ae84d0c771e1264749
3bd3ec4a09ab80f1e895dde9e9e61b75c8ec45571f2700b27eceb2779eaa4fbc  dea4b4adf4efdced18bf602d391777d5b00b7c9c18ae5bb79c5d928d3698576d
3d8f0eb2afcb08b0ee25bd58c3b072ed80c2e523ceeff13bd8602c06639740ea  e1cba0aca8b42c672fc6d26d86adf6989d5ac347efb5f3340e96cc4c741b3c55
3f04bdce6745b051acb9c95ab9c99b2bd99d3c0faa2765301c03748d03791926  e5f74b60982dc8a7c7e18ae6b27b4d294ddad8e9fa5295e363c38bc12b81d776
8d6f7481bcb0c219bf1e4561838116fe92d8b513c5d607348a8796886e5a4a18  metadata.db

** root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker/volumes# cd 0e56ca51c5183c9b73b8d8361a3e2d4a80f666d5f08397d98e9f198d000f90f1/
** root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker/volumes/0e56ca51c5183c9b73b8d8361a3e2d4a80f666d5f08397d98e9f198d000f90f1# ll
total 12
drwx-----x  3 root root 4096 mar 21 13:38 ./
drwx-----x 16 root root 4096 mar 21 13:38 ../
drwxr-xr-x  2 root root 4096 mar 21 13:40 _data/
** root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker/volumes/0e56ca51c5183c9b73b8d8361a3e2d4a80f666d5f08397d98e9f198d000f90f1# cd _data/
root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker/volumes/0e56ca51c5183c9b73b8d8361a3e2d4a80f666d5f08397d98e9f198d000f90f1/_data# ls
file1.txt  file2.txt
root@jesusguarneros-ideacentre-AIO-310-20IAP:/var/lib/docker/volumes/0e56ca51c5183c9b73b8d8361a3e2d4a80f666d5f08397d98e9f198d000f90f1/_data# x



docker rm -f test      =>eliminar contenedor.

docker rm -fv test      =>eliminar volumenes y contenedor.



##### Nombrar Volumenes.

Volumen de host y volumen anonimo. 

=> sudo docker volume create mysql-data  =>  crear un volumen anonimo


verificar volumenes:

    Utilizando modo root =>

cd /var/lib/docker

cd volumes/


=> docker volume mysql-data

=> se asigna el volumen que se creo  con la carpeta que se desea ser guardada ""/var/lib/mysql"".

sudo docker run -d --name volmysql -v mysql-data:/var/lib/mysql  -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=12345678" -e "MYSQL_DATABASE=docker.db" mysql:latest


    aunque se borre el contenedor el volumen mysql-data es persistente.

sudo docker rm -fv volmysql => se borra el contenedor.


la informacion persiste.

**docker volume prune**


##### Persistiendo data de Mongo

sudo docker run -d -p 27017:27017 -- name mongopruebadb  -v  /opt/mongo/:/data/db mongo:latest


##### Persistiendo data de nginx

docker run -d --name nginx  -p 80:80 -v /home/jesus/nginx/:/var/log/nginx/ nginx
