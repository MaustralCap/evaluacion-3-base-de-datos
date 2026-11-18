// 1. IMPORTACIÓN DE LIBRERÍAS Y MÓDULOS
// Carga las variables de seguridad del archivo .env en process.env
require("dotenv").config();

// Importa Express 
const express = require("express");

// Importa CORS para permitir Live Server se comunique con el backend
const cors = require("cors");

// Importa el controlador de MySQL
const mysql = require("mysql2/promise");

// Inicializa la aplicación de Express
const app = express();

// Puerto donde el servidor lee el .env o usa el 3000 por defecto
const PORT = process.env.PORT || 3000;


// 2. CONFIGURACIÓN DE SEGURIDAD (CORS Y JSON)
// Permite que peticiones accedan a la API
app.use(cors({
    origin: ["http://127.0.0.1:5500", "http://localhost:5500"]
}));

// Habilita a Express para procesar datos enviados en formato JSON
app.use(express.json());

// 3. CREACIÓN DEL POOL DE CONEXIONES A MYSQL
const pool = mysql.createPool({
    host: process.env.DB_HOST,         // Servidor localhost
    port: Number(process.env.DB_PORT || 3306), // Puerto de MySQL
    user: process.env.DB_USER,         // Usuario
    password: process.env.DB_PASSWORD, // Contraseña BD
    database: process.env.DB_DATABASE, // Nombre de la BD
    waitForConnections: true,
    connectionLimit: 10                
});

// 4. RUTAS O ENDPOINTS DEL SERVIDOR
// Ruta raíz de prueba para verificar que el servidor está encendido
app.get("/", (req, res) => {
    res.send("Backend de Hyrule Compendium MySQL funcionando.");
});

// Ruta principal de la API consulta elementos usando INNER JOIN
app.get("/api/elementos", async (req, res) => {
    try {
        // Consulta SQL 
        // Une la tabla de elementos con la de categorías
        const consulta = `
            SELECT 
                e.elemento_id AS id,
                e.nombre,
                e.descripcion,
                e.imagen,
                c.nombre AS categoria
            FROM zelda_elementos AS e
            INNER JOIN zelda_categorias AS c 
            ON e.categoria_id = c.categoria_id
            ORDER BY e.nombre;
        `;

        // Ejecuta la consulta en la base de datos 
        const [filas] = await pool.query(consulta);

        // Devuelve el resultado en formato JSON al navegador
        res.json(filas);

    } catch (error) {
        // Si ocurre un error en la base de datos, lo muestra en consola y responde con un error 500
        console.error("Error al consultar elementos:", error.message);
        res.status(500).json({ mensaje: "Error al consultar la base de datos." });
    }
});

// 5. ENCENDIDO DEL SERVIDOR
// Pone al servidor en el puerto configurado en segundo plano 
app.listen(PORT, () => {
    console.log("Servidor escuchando en el puerto " + PORT);
});