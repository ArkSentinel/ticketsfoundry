# TicketsFoundry

TicketsFoundry es una plataforma de gestion de soporte tecnico diseñada para centralizar incidencias, optimizar tiempos de respuesta y ofrecer analiticas claras a traves de un dashboard administrativo. 

Construida con Rails 8, esta aplicacion utiliza un sistema de roles jerarquicos y una interfaz moderna basada en Bootstrap.

---

## Tecnologias Principales

* **Backend:** Ruby on Rails 8.1.2
* **Frontend:** Bootstrap y Hotwire (Turbo/Stimulus)
* **Base de Datos:** SQLite3 (Compatible con PostgreSQL para produccion)
* **Autenticacion:** Devise
* **Graficos:** Chartkick (Dashboard interactivo)
* **Gestion de Fondo:** Solid Queue y Solid Cache (Arquitectura moderna de Rails 8)

---

## Gestion de Usuarios y Roles

El sistema implementa tres niveles de acceso claramente definidos mediante enums:

1. **Customer (Cliente):**
   * Genera tickets detallando falla, descripcion, categoria y nivel de urgencia.
   * Panel personal para seguimiento del estado de sus solicitudes.

2. **Agent (Agente):**
   * Gestion activa de tickets entrantes.
   * Capacidad para actualizar estados y resolver incidencias asignadas.

3. **Admin (Administrador):**
   * **Control de Cuentas:** CRUD completo de usuarios (creacion, edicion y gestion de permisos).
   * **Configuracion:** Gestion del catalogo de categorias de tickets.
   * **Estadisticas:** Dashboard global con metricas de rendimiento y volumen de tickets.

---

## Arquitectura de Datos

El sistema utiliza una estructura relacional para garantizar la integridad de la informacion y la trazabilidad de cada ticket.



---

## Instalacion y Configuracion

Sigue estos pasos para ejecutar el proyecto en tu entorno local:

### 1. Requisitos previos
* Ruby 3.2.0 o superior
* SQLite3
* Node.js (opcional, dependiendo de la configuracion de assets)

### 2. Clonar y configurar
```bash
# Clonar el repositorio
git clone [https://github.com/tu-usuario/ticketsfoundry.git](https://github.com/tu-usuario/ticketsfoundry.git)
cd ticketsfoundry

# Instalar las gemas necesarias
bundle install

# Configurar la base de datos y ejecutar migraciones
bin/rails db:prepare