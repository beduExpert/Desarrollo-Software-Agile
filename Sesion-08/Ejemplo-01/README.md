# Ejemplo 1 - Pipelines Jenkins

## Objetivo

• Crear Pipelines declarativos en Jenkins para ejecutar pruebas

## Desarrollo 💡

Aquí se describen las actividades que se realizan en el servicio Jenkins:

1. Crear nuevo Pipeline

En el `Dashboard` principal de Jenkins hacemos clic en `New item`.

Nombrar el item como `accounts`, seleccionar el tipo `Pipeline` y hacer clic en `Ok`.

![Alt text](..//Ejemplo-01/assets/jenkins-add-item-pipeline.png?raw=true "Jenkins add Pipeline")

En la sección `Pipeline`, selecionar en `Definition` la opción `Pipeline script from SCM`.

En `SCM` seleccionamos `Git`, en `Repository URL` usamos `https://github.com/myuser/myapi-accounts.git`.

![Alt text](..//Ejemplo-01/assets/jenkins-pipeline-scm-1.png?raw=true "Jenkins Pipeline SCM Jenkinsfile part 1")

En `Branches to build`, seleccionamos `*/main`.

En `Script Path` se debe usar `Jenkinsfile`, que es el archivo que está en la raíz del repositorio de la aplicación.

![Alt text](..//Ejemplo-01/assets/jenkins-pipeline-scm-2.png?raw=true "Jenkins Pipeline SCM Jenkinsfile part 2")

Hacer clic en `Save` para guardar los cambios.

2. Ejecutar Pipeline manualmente

Ahora  estando en el Dashboard y en tu pipeline llamado `accounts`, hacer clic en el botón `Build Now` para iniciar
la construcción de tu aplicación.

![Alt text](..//Ejemplo-01/assets/jenkins-pipeline-run-1.png?raw=true "Jenkins Pipeline Run part 1")

3. Visualización de Builds y logs de consola

Ahora puede seleccionar el Build desde `Build History`, y ver los detalles del build a nivel Git, tales como la revisión
ó el ID del commit, el repositorio y la rama.

![Alt text](..//Ejemplo-01/assets/jenkins-pipeline-log-1.png?raw=true "Jenkins Pipeline Log part 1")

Ahi también puede ir a `Console Output` se puede ver todo el detalle de las tareas que se ejecutan en cada fase del pipeline.

![Alt text](..//Ejemplo-01/assets/jenkins-pipeline-log-2.png?raw=true "Jenkins Pipeline Log part 2")