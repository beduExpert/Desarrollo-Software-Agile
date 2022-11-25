# Ejemplo 4 - Escaneo Vulnerabilidades OWASP dependency checker

## Objetivo

• Integración de pruebas de escaneo de vulnerabilidaes en dependencias en Jenkins

## Desarrollo 💡

2. Instalar el programa maven

Nos conectamos al shell del contenedor jenkins:

```shell
docker exec -it -u root jenkins /bin/bash
```

Instalamos dependencias:

```shell
apt update; apt install maven
```

3. Instalar el plugin HTML Publisher

Vamos al menú `Manage Jenkins`, luego a `Manage Plugins`, y en `Available plugins`, buscamos el plugin `HTML Publisher` y lo instalamos.

4. Agrega el Pipeline para el repo `pet-clinic`.

5. Agrega el plugin de dependency check:

Edita el archivo `pom.xml` y en la sección de `<plugins>`, al final agrega este plugin:

```xml
                        <plugin>
                           <groupId>org.owasp</groupId>
                           <artifactId>dependency-check-maven</artifactId>
                           <version>6.2.2</version>
                           <configuration>
                               <format>ALL</format>
                               <failBuildOnCVSS>7</failBuildOnCVSS>
                               <cveValidForHours>168</cveValidForHours>
                           </configuration>
                           <executions>
                               <execution>
                                   <goals>
                                       <goal>check</goal>
                                   </goals>
                               </execution>
                           </executions>
                       </plugin>
```

Sube tu cambio y prueba tu pipeline.

6. Agrega en el pipeline el check de dependencias

Edita el archivo `Jenkinsfile` y antes de hacer el Build agrega este stage:

```groovy
        stage('Dependency check') {
            steps {
                sh "mvn --batch-mode dependency-check:check"
            }
            post {
                always {
                    publishHTML(target:[
                        allowMissing: true,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'target',
                        reportFiles: 'dependency-check-report.html',
                        reportName: "OWASP Dependency Check Report"
                    ])
                }
            }
        }
```

Sube tu cambio y prueba tu pipeline.