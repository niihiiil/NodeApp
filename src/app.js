const express = require('express');
const sql = require('mssql');
const dbConfig = require('./database/dbConfig'); // Importar la configuración de la base de datos
const path = require('path');
const proveedoresController = require('./controllers/proveedoresController');
const comprasController = require('./controllers/comprasController'); // Importar el controlador de compras

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

// Configurar el middleware para analizar el cuerpo de la solicitud en formato JSON
app.use(express.json());

// Configurar rutas estáticas
app.use(express.static(path.join(__dirname, 'public')));

// Rutas controladores de proveedores
app.get('/proveedores', proveedoresController.getProveedores);
app.post('/proveedores', proveedoresController.guardarProveedor);
app.put('/proveedores/:idProveedor', proveedoresController.editarProveedor);
app.delete('/proveedores/:idProveedor', proveedoresController.eliminarProveedor);

// Rutas controladores de compras
app.get('/compras', comprasController.getCompras);
app.post('/compras', comprasController.guardarCompra);
app.put('/compras/:idCompra', comprasController.editarCompra);
app.delete('/compras/:idCompra', comprasController.eliminarCompra);

// Iniciar el servidor
app.listen(port, () => {
  console.log(`La Torre Lib's está corriendo en http://localhost:${port}`);
});
