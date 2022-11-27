# Ejemplo 3 - Integración SonarQube y Jenkins

## Objetivo 🎯

• Integración de SonarQube con Jenkins para hacer pruebas de análisis de código estático.

## Requisitos 📘

Para realizar este ejemplo es necesario que tengas una copia del repositorio de `pet-clinic` en tu cuenta
Github.

En tu instancia de Jenkins debes instalar los siguientes plugins:

* Git
* GitHub
* GitHub Authenticator
* Pipeline
* Pipeline: Stage View
* Docker
* Docker Pipeline
* Environment Injector
 
## Desarrollo 💡

### SonarQube

Aquí se describen las actividades que se realizan en el servicio SonarQube:

1. Iniciar sesión en consola web de administración de SonarQube.

En el navegador abrimos el siguiente URL: `http://localhost:9000/`

Usamos las credenciales del usuario admin para iniciar sesión.

![Alt text](..//Ejemplo-03/assets/sonarqube-console.png?raw=true "SonarQube Console")

2. Crear token de acceso para conectar jenkins

Vamos al menú `Administration`, luego a `Security`, y en `Users`:

![Alt text](..//Ejemplo-03/assets/sonarqube-admin-security-users.png?raw=true "SonarQube Admin Security Users")

Vamos al menú `Administration`, luego a `Users` y luego en la cuenta de `Administrator` se da clic en el
botón de `Update Tokens`.

Se asigna el nombre del token `jenkins` y se configura sin fecha de expiración.

![Alt text](..//Ejemplo-03/assets/sonarqube-admin-token.png?raw=true "SonarQube Admin Token")

Se copia el token ya que se va a usar adelante.

### Jenkins

Aquí se describen las actividades que se realizan en el servicio Jenkins:

1. Instalar el plugin de Pipeline

Vamos al menú `Manage Jenkins`, luego a `Manage Plugins`, y en `Available plugins`, buscamos el plugin `Pipeline`
y lo instalamos.

2. Instalar el Sonar Scanner

Nos conectamos al shell del contenedor jenkins:

```shell
docker exec -it -u root jenkins /bin/bash
```

**NOTA:** Es importante que se defina el usuario `root` en la conexión, de lo contrario no se podrán instalar
paquetes dentro del contenedor.

Instalamos dependencias:

```shell
apt update; apt install wget unzip
```

Cambiamos de directorio a /opt

```shell
cd /opt
```

Descargamos el paquete de sonar-scanner:

```shell
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
```

Descomprimimos:

```shell
unzip sonar-scanner-cli-4.2.0.1873-linux.zip
```

Renombramos directorio sonnar-scanner:

```shell
mv sonar-scanner-4.2.0.1873-linux sonar-scanner
```

**NOTA:** Todos estos comandos se pueden agregar al `Dockerfile` que construye la imagen personalizada de jenkins
para tener un proceso más reproducible.

3. Instalar el plugin SonarQube Scanner

Vamos al menú `Manage Jenkins`, luego a `Manage Plugins`, y en `Available plugins`, buscamos el plugin
`SonarQube Scanner` y lo instalamos.

4. Configurar el plugin de SonarQube Scanner

Vamos al menú `Manage Jenkins` y luego a `Global Tool Configuration`, ahí vamos a la sección `SonarQube Scanner`,
y hacemos clic en `Add SonarQube Scanner`, de seleccionar la opción de `Install automatically`, y definir la ruta
de `SONAR_RUNNER_HOME` apuntando a `/opt/sonar-scanner`.

5. Agregar un secreto para el token de Sonar

Ir al menú izquierdo de `Credentials` luego a `System` y `Global credentials (unrestricted)`

Haga clic en `Add credential`, y cambiamos el tipo a `Secret text`, llenamos los campos de `Secret` con el nombre,
su `ID`, y la `Description`.

El secreto se llama `sonarqube`.

6. Configurar el servidor SonarQube

Vamos al menú `Manage Jenkins` y luego en `Configure System`, ahí vamos a `SonarQube server`, y luego en
`Add SonarQube`.

Seleccionamos la casilla de `Environment variables`,
`Enable injection of SonarQube server confirugration as build environment variables`.

Se define el `Name` a `sonarqube`, el `Server URL` a `http://172.16.0.4:9000, y en `Server authentication token` usar
el secreto de `sonarqube server`.

**IMPORTANTE:** No olvides cambiar la dirección IP de tu servidor sonar en el parámetro `sonar.host.url`.

Para obtener la dirección IP del contenedor de sonarqube usa `docker inspect sonarqube` ó también con el comando
`terraform output`.


7. Crear archivo de configuración de Sonar en repositorio aplicación

En la raíz del repositorio configuramos el archivo `sonar-project.properties` con los parámetros para SonarQube Scanner:

```
sonar.host.url=http://172.16.0.4:9000
sonar.projectName=My project
sonar.projectKey=myproject
sonar.sources=./
sonar.java.binaries=target/classes
sonar.language=java
sonar.sourceEncoding=UTF-8
```

**IMPORTANTE:** No olvides cambiar la dirección IP de tu servidor sonar en el parámetro `sonar.host.url`.

8. Configurar Pipeline para hacer prueba de calidad en código

En el pipeline `Jenkinsfile` de tu proyecto `pet-clinic`, después del stage de `Build` hacer
la prueba de calidad de código:

```groovy
         stage('Code Quality') {
                   steps {
                       script {
                          def scannerHome = tool 'sonarqube';
                          withSonarQubeEnv("sonarqube") {
                          sh "${tool("sonarqube")}/bin/sonar-scanner"
                                       }
                               }
                           }
                        }
```

Para finalizar, haz cambios en una rama del proyecto y haz un pull request para que se ejecuten las pruebas
de calidad, revisar los reportes que se muestran en Jenkins para Sonar, y también verifica el reporte dentro
de la consola de administración de SonarQube.
