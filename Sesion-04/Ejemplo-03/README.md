# Ejemplo 03

## Descargar una imagen de Docker Hub y crear la imagen de Docker


En esta actividad descargarás una imagen(Ubuntu) de Docker Hub y crearás una imagen Imagen Docker propia con algunos ajustes.

1.-  Tener instalado Docker en tu local, para validar ejecuta en el siguiente comando en tu terminal:  


`docker --version`  

2.- Deberás ver algo parecido:

<pre><code>docker --version
Docker version 20.10.10, build b485636
</code></pre>

2.- Ahora, podemos revisar el siguiente link, donde se encuentra la descripción de la imagen Ubuntu, es la imagen docker oficial.


https://hub.docker.com/_/ubuntu

4.- Comenzarás ejecutando la línea de comandos que nos menciona la documentación, y veremos algo parecido:

`docker pull`  

<pre><code>Using default tag: latest
latest: Pulling from library/ubuntu
7b1a6ab2e44d: Pull complete
Digest: sha256:626ffe58f6e7566e00254b638eb7e0f3b11d4da9675088f4781a50ae288f3322
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest

</code></pre>

5.- Valida las imágenes en local:

`docker images`  

<pre><code>REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    ba6acccedd29   5 weeks ago   72.8MB
</code></pre>


6.- Inicia tu primer Contenedor con la imagen Ubuntu que descargamos a nuestro local:

`docker run -it ubuntu bash`  

<pre><code>root@8de88a3d3b85:/#
</code></pre>

7.- Vas a actualizar para tener nuestro Ubuntu al dia, ejecuta el siguiente comando, verás algo parecido como lo siguiente:

`apt-get update`  

<pre><code>root@8de88a3d3b85:/# apt-get update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal InRelease [265 kB]
Get:3 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [682 kB]
Get:4 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [809 kB]
Get:5 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [30.1 kB]
Get:6 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [1232 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:8 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
Get:9 http://archive.ubuntu.com/ubuntu focal/restricted amd64 Packages [33.4 kB]
Get:10 http://archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages [177 kB]
Get:11 http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages [11.3 MB]
Get:12 http://archive.ubuntu.com/ubuntu focal/main amd64 Packages [1275 kB]
Get:13 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [738 kB]
Get:14 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [33.3 kB]
Get:15 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [1098 kB]
Get:16 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [1689 kB]
Get:17 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [7185 B]
Get:18 http://archive.ubuntu.com/ubuntu focal-backports/main amd64 Packages [2668 B]
Fetched 19.7 MB in 4s (4626 kB/s)
Reading package lists... Done
</code></pre>

8.- Abrirás otra terminal y ejecutamos el siguiente comando, donde podrás ver algo parecido:
`docker ps`  

<pre><code>CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS         PORTS     NAMES
dfd2cfa94c57   ubuntu    "bash"    5 minutes ago   Up 5 minutes             charming_hamilton
</code></pre>

Podrás ver las características del Contenedor que se tienen en ejecución.

9.- Copia tu Container ID, en este ejemplo es el dfd2cfa94c57 y deberás ejecutar la siguiente sentencia, donde ubuntu-update es el nombre que le darás a tu imagen Docker:


`docker commit dfd2cfa94c57 ubuntu-update`  


10.- Valida tu primer imagen Docker creada, a partir de una Imagen Docker existente:

`docker images`  

<pre><code>docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
ubuntu-update   latest    31889a5b4786   14 seconds ago   104MB
ubuntu          latest    ba6acccedd29   5 weeks ago      72.8MB
</code></pre>

11.- Podrás ver que el tamaño de nuestra imagen ha incrementado, esto debido a los paquetes que instalamos al ejecutar 


`apt-get update`  