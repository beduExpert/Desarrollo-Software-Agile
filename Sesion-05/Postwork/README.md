

### POSTWORK ###
---

</br>

**`Sesi贸n 02`**


</br>

# Creaci贸n de c贸digo en distintas ramas y fusi贸n entre ellas. #

</br>

馃幆 Objetivo

</br>

Crear un repositorio con distintos branchs.
Modificar el c贸digo principal en distintas ramas.
Subir archivos y directorios a Master/Main.

</br>


Antes de empezar

</br>

馃鈥嶐煉? Nota de expert@ 

En esta secci贸n encontrar谩s algunos tips por si alg煤n recurso mostrado viene en otro idioma y encontrar谩s la instalaci贸n necesaria para tu m贸dulo.

</br>

Algunos recursos est谩n en ingl茅s. Si prefieres leerlos en espa帽ol, puedes hacer de Google tu traductor predeterminado, quien te ofrecer谩 la opci贸n de traducir la p谩gina que vas a consultar. 


</br>

Otra opci贸n es usar un traductor desde cualquier buscador.  


</br>

## 鈿欙笍 Setup ##

</br>

### Editor de c贸digo. ###

* Visual Studio Code 

</br>

### Versionamiento de c贸digo. ###
* Git 
* Tener una cuenta de GitHub

</br>


  # Desarrollo 馃殌

</br>

## Descripci贸n: ##
</br>

En este PostWork vas a trabajar con 3 desarrolladores, cada uno con una copia de Master/Main, o sea, cada quien har谩 una rama directa de la rama principal, toma en cuenta los siguientes pasos:

1. Crea un repo en **`github.com`**

</br>


![Alt text](..//Postwork/assets/1.png?raw=true "DevOps")



</br>

* Coloca un nombre como: **`DevOpsBeduReto02`**

</br>


![Alt text](..//Postwork/assets/2.png?raw=true "DevOps")

</br>

**` Nota: `** Al reto deber谩s a帽adirle el **`README.md`**

</br>


![Alt text](..//Postwork/assets/2.1.png?raw=true "DevOps")

</br>


3. Clona el **`branch `** en tu local, como se muestra en la imagen:



</br>

![Alt text](..//Postwork/assets/s2-e02-04.png?raw=true "DevOps")

</br>

4. Puede ser directo en el cliente de **`GitHub Desktop.`**


![Alt text](..//Postwork/assets/s2-e02-05.png?raw=true "DevOps")

</br>

5. Pega la direcci贸n en el apartado : **`URL`**

![Alt text](..//Postwork/assets/s2-e02-06.png?raw=true "DevOps")

</br>

6. Abre el nuevo Repositorio con el editor de texto.


![Alt text](..//Postwork/assets/s2-e02-07.png?raw=true "DevOps")


7. Vas a crear la siguiente estructura de archivos y directorios, en **`Master/Main:`**
</br>

~~~
.
鈹溾攢鈹? README.md
鈹斺攢鈹? python
    鈹斺攢鈹? aplicacion.py

~~~
</br>






Donde el contenido de **`aplicacion.py `** tendra la siguientes lineas:


</br>

~~~

def main():
  # Imprimir en pantalla mensaje.
  print("Hola Bedu! Esto Es Codigo de la Rama Principal!")
# Llamando a funcion principal.
main()

~~~
</br>



8. Prepara el Commit para subirlo a **`Master/Main.`**

</br>

![Alt text](..//Postwork/assets/s2-e02-11.png?raw=true "DevOps")

</br>

9. Recuerda el Objetivo: **`Tienes 3 desarrolladores`**
, donde cada desarrollador estar谩 trabajando en una caracter铆stica
**`(Feature)`** nueva de tu aplicaci贸n. Ya que tienes desarrollado tu plan de trabajo, vas a crear los **`branchs`** en el cliente de **`GitHub:`**


</br>

10. Cada desarrollador deber谩 estar trabajando en su propia rama **`(branch)`**. Quedando de la siguiente manera:

</br>

## Desarrollador 1: ##


#### Caracter铆stica:  Bot贸n de Inicio

#### Rama: feature/botonIniciar

</br>


![Alt text](..//Postwork/assets/s2-e02-08.png?raw=true "DevOps")



</br>


## Desarrollador 2: ##

</br>

#### Caracter铆stica: Bot贸n de Detener

#### Rama: feature/botonDetener


</br>

![Alt text](..//Postwork/assets/s2-e02-09.png?raw=true "DevOps")


</br>


## Desarrollador 3: ##

</br>

#### Caracter铆stica: Bot贸n de Siguiente
#### Rama: feature/botonSiguiente

</br>


![Alt text](..//Postwork/assets/s2-e02-10.png?raw=true "DevOps")

</br>

11. Ahora, cada desarrollador tiene una copia en la rama principal en su local, y puedes comenzar a codificar sin interferir en los cambios de los dem谩s.

</br>

12. Dentro del directorio **`python`** crea una clase nueva por rama, o sea, cada desarrollador subir谩 una clase distinta:


</br>

## Desarrollador 1: ##

</br>

Archivo:
</br>
**`aplicacionDev01.py`**


</br>


~~~
def main():
  # Imprimir en pantalla mensaje.
  print("Hola Bedu! Esto Es Codigo del Desarrollador 1")
# Llamando a funcion principal.
main()
~~~
</br>


Quedando de la siguiente manera:

![Alt text](..//Postwork/assets/s2-e02-11.png?raw=true "DevOps")

</br>

Sube el cambio a la rama principal.


![Alt text](..//Postwork/assets/s2-e02-12.png?raw=true "DevOps")

</br>


Ahora, deber谩s crear tu **`Pull Request `** como se muestra a continuaci贸n:

</br>

![Alt text](..//Postwork/assets/s2-e02-13.png?raw=true "DevOps")

</br>

Dir铆gete a GitHub.com para finalizar el **`Pull Request (PR):`**

</br>


![Alt text](..//Postwork/assets/s2-e02-14.png?raw=true "DevOps")

</br>

De la siguiente forma ver谩s tu **`PR`**
 en espera de ser fusionado **`(Merged)`**

 </br>


![Alt text](..//Postwork/assets/s2-e02-15.png?raw=true "DevOps")

</br>

Te solicitar谩 confirmaci贸n para realizar la fusion **`(Merged)`**


</br>


![Alt text](..//Postwork/assets/s2-e02-16.png?raw=true "DevOps")

</br>

## Nota: Se recomienda la eliminaci贸n de la rama  ###     
**`(branch)`**

</br>

![Alt text](..//Postwork/assets/s2-e02-17.png?raw=true "DevOps")

</br>

13. Importante:
**`Repite los pasos del punto 12`**
, 煤nicamente creando los archivos correspondientes por desarrollador, quedando de la siguiente manera:

</br>

## Desarrollador 2: ##

</br>

Archivo:

**` aplicacionDev02.py `**


</br>

~~~
def main():
  # Imprimir en pantalla mensaje.
  print("Hola Bedu! Esto Es Codigo del Desarrollador 2")
# Llamando a funcion principal.
main()
~~~

</br>


### Desarrollador 3: ###

</br>

Archivo:

**`aplicacionDev03.py`**

</br>

~~~

def main():
  # Imprimir en pantalla mensaje.
  print("Hola Bedu! Esto Es Codigo del Desarrollador 3")
# Llamando a funcion principal.
main()

~~~
</br>


14. Si todo ha salido de forma correcta, ahora debemos tener 3 nuevos archivos **` Python `** en nuestra rama **`Master/Main.`**


Solo resta traer los cambios al local, quedando de la siguiente manera:

</br>


![Alt text](..//Postwork/assets/s2-e02-29.png?raw=true "DevOps")





 隆Felicidades!, has concluido el PostWork.馃槂


## 隆Recapitulemos! ##

* Deber谩s crear un repositorio con distintos branchs.
* Modificar el c贸digo principal en distintas ramas.
* Clonar un branch.
* Estructurar archivos y directorios
* Subir archivos y directorios a Master/Main.
* Crear un  branchs en  GitHub.


</br>

鉁? CHECKLIST 

Considera que tu proyecto debe cumplir con lo siguiente:



![Alt text](..//Postwork/assets/lista.png?raw=true "DevOps") 


