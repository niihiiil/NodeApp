const express = require('express');
const sql = require('mssql');
const dbConfig = require('./database/dbConfig');
const path = require('path');
const proveedoresController = require('./controllers/proveedoresController');
const comprasController = require('./controllers/comprasController');

const app = express();
const port = 3000;

const connectionConfig = {
  ...dbConfig,
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
};

sql
  .connect(connectionConfig)
  .then(() => console.log('Conexión exitosa con SQL Server'))
  .catch((err) => console.error('Error al conectar con SQL Server', err));

// Configurar el middleware para analizar el cuerpo de la solicitud en formato JSON
app.use(express.json());

app.use(express.static(path.join(__dirname, 'public')));

const proveedoresRoutes = require('./routes/proveedoresRoutes');
const comprasRoutes = require('./routes/comprasRoutes');

app.use('/proveedores', proveedoresRoutes);
app.use('/compras', comprasRoutes);

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

app.listen(port, () => {
  console.log(`La Torre Lib's está corriendo en http://localhost:${port}`);
});
