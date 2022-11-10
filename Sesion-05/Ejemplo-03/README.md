## Trunk-based development ##


**`Objetivo:`**



1. Crear nuevo repositorio en GitHub.com

2. Creación del primer Workflow

3. Commit de nuestra primera aplicación.

4. Generación de una nueva Rama 

5. Compilación y validación de nuestro código

6. Fusionar nuestros cambios con la Rama principal.


</br>

**`Desarrollo:`**

</br>

Crear nuevo repositorio en: 

</br>

~~~

https://github.com/new
~~~
</br>  

![Alt text](../Ejemplo-03/assets/s05-e03-01.png?raw=true "DevOps")



</br>

Nombre del Repo:
</br>

~~~
DevSecOpsS05-Ej03 
~~~
</br>

Descripción:

</br>

~~~
Ejemplo 03 Trunk-based development
~~~
</br>

Tipo de visibilidad del repo:

**Publico**
</br>

Agregar archivo inicial README.md
</br>

~~~
Add a README file
~~~
</br>

![Alt text](../Ejemplo-03/assets/s05-e03-02.png?raw=true "DevOps")

</br>

Tenemos nuevo repositorio, creado directo en github.com


Buscamos la opción Actions:

![Alt text](../Ejemplo-03/assets/s2-e03-04.png?raw=true "DevOps")


Nuevo archivo:

</br>

~~~
 DevSecOpsS05-Ej03/.github/workflows/java.yml
~~~
</br>

Contenido de nuestro java.yml

</br>

~~~
name: CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "*" ]


jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-java@v3
      with:
        distribution: 'temurin' # See 'Supported distributions' for available options
        java-version: '17'
    - run: java HolaBedu.java
~~~

</br>

![Alt text](../Ejemplo-03/assets/s05-e03-06.png?raw=true "DevOps")


Procedemos a dar commit:


![Alt text](../Ejemplo-03/assets/s05-e03-07.png?raw=true "DevOps")

</br>

Procedemos a crear un nuevo archivo:

![Alt text](../Ejemplo-03/assets/s05-e03-08.png?raw=true "DevOps")


Lo nombramos HolaBedu.java

![Alt text](../Ejemplo-03/assets/s05-e03-09.png?raw=true "DevOps")

Contenido de nuestro archivo:

~~~
public class HolaBedu {
  public static void main(String[] args) {
    System.out.println("Hola expertos!");
  }
}
~~~

Hacemos commit del archivo: 

![Alt text](../Ejemplo-03/assets/s05-e03-10.png?raw=true "DevOps")

Podemos ver nuestra action trabajando:

![Alt text](../Ejemplo-03/assets/s05-e03-11.png?raw=true "DevOps")

Clonamos nuestro repositorio: 

![Alt text](../Ejemplo-03/assets/s05-e03-12.png?raw=true "DevOps")

En GitHub de escritorio agregamos la URL

![Alt text](../Ejemplo-03/assets/s05-e03-13.png?raw=true "DevOps")

Buscamos la opción de abrir en Visual Studio Code:

![Alt text](../Ejemplo-03/assets/s05-e03-14.png?raw=true "DevOps")

Seleccionamos la opción de branches: 

![Alt text](../Ejemplo-03/assets/s05-e03-15.png?raw=true "DevOps")

Creamos una nueva llamada feature/updateApp:

![Alt text](../Ejemplo-03/assets/s05-e03-16.png?raw=true "DevOps")

Realizamos cambios en el archivo HolaBedu.java desde nuestro editor de codigo: 

![Alt text](../Ejemplo-03/assets/s05-e03-17.png?raw=true "DevOps")

Agregamos el commit a nuestra rama: 

![Alt text](../Ejemplo-03/assets/s05-e03-18.png?raw=true "DevOps")

Creacmos un pull request:

![Alt text](../Ejemplo-03/assets/s05-e03-19.png?raw=true "DevOps")

Nuestro pull request compilo éxitosamente, podemos hacer un merge:

![Alt text](../Ejemplo-03/assets/s05-e03-20.png?raw=true "DevOps")

En la consola de GitHub seleccionamos Mergue pull request: 

![Alt text](../Ejemplo-03/assets/s05-e03-21.png?raw=true "DevOps")

Podemos ver los cambios como merged con los archivos nuevos: 

![Alt text](../Ejemplo-03/assets/s05-e03-22.png?raw=true "DevOps")