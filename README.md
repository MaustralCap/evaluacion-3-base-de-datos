# Hyrule compendium anexado a una base de datos

Aplicación web desarrollada para integrar un frontend interactivo, un backend en Node.js/Express y una base de datos relacional en MySQL, mostrando información del compendio de *Zelda: Breath of the Wild*.

- backend/: Servidor Node.js, configuración de la API y archivo SQL dump (`datos.sql`).
- frontend: Interfaz visual con HTML, CSS, JavaScript y Bootstrap.

---

## Como ejecutar
-------------------
### 1. Base de Datos
1. Abrir MySQL Workbench.
2. Importar o ejecutar el script de respaldo ubicado en backend/datos.sql para crear la base de datos `zelda_botw_db` con sus respectivas tablas y relaciones de prueba como INNER JOIN.

### 2. Configuración y Backend Node.js en Visual Code Studio

1. Crear un archivo .env para intertar las credenciales en la siguiente manera:
    PORT=3000
    DB_HOST=localhost
    DB_PORT=3306
    DB_DATABASE=zelda_botw_db
    DB_USER=root
    DB_PASSWORD=root

2. Abrir la terminal y dirígete a la carpeta del backend:
   ```bash
   cd backend

3. Instalar los nodos en la terminal cmd (El paso anterior de cd backend es necesario):
    npm install

4. Una vez instalado habrán otros archivos dentro del backend, luego iniciar el servidor:
    node server.js
Se verifica con un mensaje en la consola "Servidor escuchando en el puerto 3000"

5. Abrir la carpeta frontend, abrir index.html y dar click en Go Live para ver la página web

Así es como se ejecuta de forma impecable.