const express = require('express');
const sql = require('mssql');
const dbConfig = require('./database/dbConfig'); // Importar la configuración de la base de datos
const path = require('path');
const proveedoresController = require('./controllers/proveedoresController');

const app = express();
const port = 3000;

// Establecer la conexión con SQL Server
const connectionConfig = {
  ...dbConfig,
  options: {
    encrypt: true,
    trustServerCertificate: true
  }
};

sql.connect(connectionConfig)
  .then(() => console.log('Conexión exitosa con SQL Server'))
  .catch((err) => console.error('Error al conectar con SQL Server', err));

// Configurar rutas estáticas
app.use(express.static(path.join(__dirname, 'public')));

// Ruta para obtener los proveedores
app.get('/proveedores', proveedoresController.getProveedores);

// Iniciar el servidor
app.listen(port, () => {
  console.log(`La Torre Lib's está corriendo en http://localhost:${port}`);
});
