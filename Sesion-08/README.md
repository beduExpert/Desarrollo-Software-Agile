## Sesión 8: CI/CD con Jenkins / testing 🤖

### 1. Objetivos :dart: 

- Configurar Pipelines de CI/CD con Jenkins
- Configuración de herramientas de Test y Seguridad

### 2. Contenido :blue_book:

Docker te ayudará a automatizar el despliegue de aplicaciones dentro de contenedores de software, proporcionando una capa adicional de abstracción y automatización de virtualización de aplicaciones en múltiples sistemas operativos. 

Por otra parte, dentro del flujo de integración es importante utilizar una plataforma para evaluar código fuente. Hay muchas de software libre y paga, y usan diversas herramientas de análisis estático de código fuente como Checkstyle, PMD o FindBugs para obtener métricas que pueden ayudar a mejorar la calidad del código de un programa. Como DevOps es importante automatizar dichos procesos y notificar anomalías a las áreas hermanas (Desarrollo, Producción y QA).

---

#### Tema 1

Se configuran Pipelines declarativos basados en SCM Git en Jenkins para automatizar las pruebas del proyecto.

- [**`EJEMPLO 1`**](./Ejemplo-01)

---

#### Tema 2

Instalamos el servicio SonarQube para hacer pruebas de análisis de código estático del código de tu aplicación.

- [**`EJEMPLO 2`**](./Ejemplo-02)

---

#### Tema 3

Integraremos pruebas de seguridad en el código a través de análisis estático. Integramos SonarQube con Jenkins para hacer los tests desde el Pipeline.

- [**`EJEMPLO 3`**](./Ejemplo-03)

---

#### Tema 4

Integramos pruebas de vulnerabildades en el código de la aplicación usando OWASP ZAP. El cual analiza las dependencias de las aplicaciones
para detectar vulnerabilidades que pongan en riesgo la aplicación.

- [**`EJEMPLO 4`**](./Ejemplo-04)

---

### 3. Postwork

Encuentra las indicaciones y consejos para reflejar los avances de tu proyecto de este módulo.

- [**`POSTWORK SESIÓN 1`**](./Postwork/)