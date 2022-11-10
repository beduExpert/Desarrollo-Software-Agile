## `RETO 3`




</br>


![Alt text](../Reto-03/assets/github.png?raw=true "DevOps")


</br> 


**`Completa el siguiente Reto: `**


</br>



***1. Crear un repositorio nuevo en github***
</br>
Incluyendo su Readme.

</br>

***2. Ahora crea en Actions un nuevo workflow de tipo Python***
</br>
Creando el siguiente archivo con el siguiente contenido.


*java.yml
</br>


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

***3. Agrega el siguiente archivo.***



/HolaBedu.java
</br>

~~~
public class HolaBedu {
  public static void main(String[] args) {
    System.out.println("Hola esto apenas empieza!");
  }
}
~~~



***4. Asegurate de subir los cambios al repositorio.***

</br>

***5. Crea un nuevo***
**` Branch `**


</br>

***6. Edita  el archivo HolaBedu.java en la linea*** **`println`**

</br>

***7. Sube este ultimo cambio a tu***
**`Branch`**

</br>

***8. Regresa **` GitHub`** y crea un***
**` Pull Request`**

</br>

***9. Muevete a **` Action `**
, y si todo salio bien  veras  tu***
**` Workflow `**

</br>

***10. Regresa a tu 
**` Pull Request `**
 y ya podras fucionarlo*** **` (Merged) `**

</br>

***11. No olvides eliminar tu***
**` Branch  `**
</br>