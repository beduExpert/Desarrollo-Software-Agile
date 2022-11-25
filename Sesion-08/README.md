## Sesión 8: CI/CD con Jenkins / testing 🤖

<img src="../images/android-kotlin.png" align="right" height="120" hspace="10">
<div style="text-align: justify;">

### 1. Objetivos :dart: 

- Configurar Pipelines de CI/CD con Jenkins
- Configuración de herramientas de Test y Seguridad

### 2. Contenido :blue_book:

Docker te ayudará a automatizar el despliegue de aplicaciones dentro de contenedores de software, proporcionando una capa adicional de abstracción y automatización de virtualización de aplicaciones en múltiples sistemas operativos. 

Por otra parte, dentro del flujo de integración es importante utilizar una plataforma para evaluar código fuente. Hay muchas de software libre y paga, y usan diversas herramientas de análisis estático de código fuente como Checkstyle, PMD o FindBugs para obtener métricas que pueden ayudar a mejorar la calidad del código de un programa. Como DevOps es importante automatizar dichos procesos y notificar anomalías a las áreas hermanas (Desarrollo, Producción y QA).

---

<img src="images/tools.png" align="right" height="90"> 

#### <ins>Tema 1</ins>

Se configuran Pipelines declarativos basados en Git en Jenkins para automatizar las pruebas de el proyecto.

- [**`EJEMPLO 1`**](./Ejemplo-01)

---

<img src="images/structure.png" align="right" height="90"> 

#### <ins>Tema 2</ins>

Instalamos el servicio SonarQube para hacer pruebas de análisis de código estático del código de tu aplicación.

- [**`EJEMPLO 2`**](./Ejemplo-02)

---

<img src="images/emulator.jpg" align="right" height="90"> 

#### <ins>Tema 3</ins>

Integraremos pruebas de seguridad en el código a través de análisis estático. Integramos SonarQube con Jenkins para hacer los tests desde el Pipeline.

- [**`EJEMPLO 3`**](./Ejemplo-03)

---

<img src="images/chaomi.png" align="right" height="110"> 

#### <ins>Tema 4</ins>

Integramos pruebas de vulnerabildades en el código de la aplicación usando OWASP ZAP. El cual analiza las dependencias de las aplicaciones
para detectar vulnerabilidades que pongan en riesgo la aplicación.

- [**`EJEMPLO 4`**](./Ejemplo-04)

---

### 3. Postwork :memo:

Encuentra las indicaciones y consejos para reflejar los avances de tu proyecto de este módulo.

- [**`POSTWORK SESIÓN 1`**](./Postwork/)