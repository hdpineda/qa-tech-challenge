# PRUEBA TÉCNICA QA - Ruby

Este repositorio contiene la solución automatizada para el reto técnico de QA. El proyecto implementa pruebas E2E para Frontend (Web) y Backend (API) utilizando **Ruby**, **Cucumber** y **Selenium**.

---

## Tech Stack

* **Lenguaje:** Ruby 3.4.8
* **Framework BDD:** Cucumber (Gherkin)
* **Web Automation:** Capybara + Selenium WebDriver
* **Patrón de Diseño:** Page Object Model (con la gema `site_prism`)
* **API Automation:** HTTParty
* **Contract Testing:** JSON Schema Validator
* **Validaciones:** RSpec Expectations
---

## Estructura del Proyecto

El proyecto sigue una arquitectura modular basada en principios SOLID para facilitar el mantenimiento y la escalabilidad:

```text
qa-tech-challenge/
├── features/
│   ├── step_definitions/   # Lógica que conecta Gherkin con el código
│   ├── support/            # Configuración del navegador (Driver) y Hooks
│   ├── api.feature         # Escenarios de prueba para Backend (ReqRes)
│   └── frontend.feature    # Escenarios de prueba para Frontend (Applitools)
├── src/
│   ├── api/                # Cliente HTTP encapsulado (ReqResClient)
│   ├── pages/              # Page Objects (Mapeo de elementos Web y acciones)
│   └── schemas/            # Contratos JSON para validación de estructura API
├── Gemfile                 # Gestión de dependencias
└── README.md               # Documentación del proyecto
```
---

## Pre-requisitos
Tener instalado Ruby (versión 3.0 o superior).
Tener instalado Google Chrome.
Tener instalado Git.

## Instalación
**Clonar el repositorio:**
```bash
git clone https://github.com/hdpineda/qa-tech-challenge.git
cd challenge_qa_ruby
```
**Instalar las dependencias (Gemas):**
```bash
bundle install
```

## Ejecución de Pruebas
1. **Prueba logica**
ejecuta el archivo de test
```bash
ruby test_logic.rb
```
Puedes ejecutar las pruebas de diferentes maneras según la necesidad:

2. **Ejecutar Todo (Frontend + API)**
Para correr la suite completa de pruebas:
```bash
cucumber
```
3. **Ejecutar solo Frontend (Applitools)**
Ejecuta los casos de Login, validación de tabla y validación visual de colores:
```bash
cucumber features/frontend.feature
```
usando el tag: 
```bash
cucumber --tags @negative
```

4. **Ejecutar solo API (ReqRes)**
Ejecuta los casos de creación de usuario, validación de contratos y códigos de estado:
```bash
cucumber --tags @api
```
---
## Nota Importante sobre Escenario API E2E
El escenario "Crear usuario, extraer ID y validar persistencia de datos" (@E2E) está diseñado para fallar en el último paso (GET) intencionalmente o comportarse como una simulación.

**Razón:** La API pública ReqRes.in es un Mock. Permite realizar peticiones POST y devuelve un ID de éxito (ej. 201), pero no persiste los datos en su base de datos.

**Consecuencia:** Al intentar consultar inmediatamente el ID recién creado mediante GET, la API responde con 404 Not Found.

**Evidencia:** El código de automatización realiza correctamente la extracción del ID del POST y la inyección en el GET, demostrando la capacidad de manejar flujo de datos entre pasos, aunque la API no soporte la persistencia real.

---

## Reportes
Por defecto, Cucumber genera un reporte detallado en la consola indicando:

Pasos exitosos (Verde).
Pasos fallidos (Rojo) con su traza de error.
Resumen de escenarios ejecutados.

**Generar reporte HTML**
Si deseas un reporte visual en archivo, puedes ejecutar:

```bash
cucumber --format html --out reporte.html
```
Esto creará un archivo reporte.html en la raíz que puedes abrir con cualquier navegador.