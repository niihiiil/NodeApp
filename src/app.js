const express = require('express');
const sql = require('mssql');
const dbConfig = require('./database/dbConfig'); // Importar la configuración de la base de datos
const path = require('path');

const app = express();
const port = 3000;

// Establecer la conexión con SQL Server
const connectionConfig = {
  ...dbConfig,
  options: {
    encrypt: false // Ignorar errores de certificado
  }
};

sql.connect(connectionConfig)
  .then(() => console.log('Conexión exitosa con SQL Server'))
  .catch((err) => console.error('Error al conectar con SQL Server', err));

// Configurar rutas estáticas
app.use(express.static(path.join(__dirname, 'public')));


// Configurar las rutas
const proveedoresController = require('./controllers/proveedoresController');
app.get('/proveedores', proveedoresController.obtenerListaProveedores);
//app.post('/proveedores/agregar', proveedoresController.agregarProveedor);

// Iniciar el servidor
app.listen(port, () => {
  console.log(`La Torre Lib's está corriendo en http://localhost:${port}`);
});

