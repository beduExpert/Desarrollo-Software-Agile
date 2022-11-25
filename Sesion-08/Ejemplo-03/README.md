# Ejemplo 3 - Integración SonarQube y Jenkins

## Objetivo

• Integración de SonarQube con Jenkins para hacer pruebas de análisis de código estático.

## Desarrollo 💡

Aquí se describen las actividades que se realizan en el servicio SonarQube:

1. Iniciar sesión en consola web de administración de SonarQube.

En el navegador abrimos el siguiente URL: `http://localhost:9000/`

Usamos las credenciales del usuario admin para iniciar sesión.

![Alt text](..//Ejemplo-03/assets/sonarqube-console.png?raw=true "SonarQube Console")

2. Crear token de acceso para conectar jenkins

Vamos al menú `Administration`, luego a `Security`, y en `Users`:

![Alt text](..//Ejemplo-03/assets/sonarqube-admin-security-users.png?raw=true "SonarQube Admin Security Users")

Vamos al menú `Administration`, luego a `Users` y luego en la cuenta de `Administrator` se da clic en el botón de `Update Tokens`.

Se asigna el nombre del token `jenkins` y se configura sin fecha de expiración.

![Alt text](..//Ejemplo-03/assets/sonarqube-admin-token.png?raw=true "SonarQube Admin Token")

Se copia el token ya que se va a usar adelante.

Aquí se describen las actividades que se realizan en el servicio Jenkins:

1. Instalar el plugin de Pipeline

Vamos al menú `Manage Jenkins`, luego a `Manage Plugins`, y en `Available plugins`, buscamos el plugin `Pipeline` y lo instalamos.

2. Instalar el Sonar Scanner

Nos conectamos al shell del contenedor jenkins:

```shell
docker exec -it -u root jenkins /bin/bash
```

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

3. Instalar el plugin SonarQube Scanner

Vamos al menú `Manage Jenkins`, luego a `Manage Plugins`, y en `Available plugins`, buscamos el plugin `SonarQube Scanner` y lo instalamos.

4. Configurar el plugin de SonarQube Scanner

Vamos al menú `Manage Jenkins` y luego a `Global Tool Configuration`, ahi vamos a la sección `SonarQube Scanner`, y hacemos clic en
`Add SonarQube Scanner`, deseleccionar la opción de `Install automatically`, y definir la ruta de `SONAR_RUNNER_HOME` apuntando a
`/opt/sonar-scanner`.

5. Agregar un secreto para el token de Sonar

Ir al menú izquierdo de `Credentials` luego a `System` y `Global credentials (unrestricted)`

Haga clic en `Add credential`, y cambiamos el tipo a `Secret text`, llenamos los campos de `Secret` con el nombre, su `ID`, y la `Description`.

El secreto se llama `sonarqube`.

6. Configurar el servidor SonarQube

Vamos al menú `Manage Jenkins` y luego en `Configure System`, ahi vamos a `SonarQube server`, y luego en `Add SonarQube`.

Seleccionamos la casilla de `Environment variables`, `Enable injection of SonarQube server confirugration as build environment variables`.

Se define el `Name` a `sonarqube`, el `Server URL` a `http://localhost:9000, y en `Server authentication token` usar el secreto
de `sonarqube server`.

7. Crear archivo de configuración de Sonar en repositorio aplicación

En la raíz del repositorio configuramos los parámetros para SonarQube Scanner:

```
# Comma-separated paths to directories with sources (required)
sonar.sources=./

# Language
sonar.language=java
# Encoding of sources files
sonar.sourceEncoding=UTF-8
```

8. Configurar Pipeline para hacer prueba de calidad en código

En el pipeline, después del stage de checkout hacer la prueba de calidad de código:

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