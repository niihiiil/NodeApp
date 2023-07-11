const express = require('express');
const sql = require('mssql');
const dbConfig = require('./database/dbConfig');
const path = require('path');
const proveedoresController = require('./controllers/proveedoresController');
const categoriaController = require('./controllers/categoriaController');
const productoController = require('./controllers/productoController');
const stockController = require('./controllers/stockController');

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
const productosRoutes = require('./routes/productosRoutes');
const categoriasRoutes = require('./routes/categoriasRoutes');
const stockRoutes = require('./routes/stockRoutes');

app.use('/proveedores', proveedoresRoutes);
app.use('/productos', productosRoutes);
app.use('/categorias', categoriasRoutes);
app.use('/stock', stockRoutes);

// Rutas controladores de proveedores
app.get('/proveedores', proveedoresController.getProveedores);
app.post('/proveedores', proveedoresController.guardarProveedor);
app.put('/proveedores/:idProveedor', proveedoresController.editarProveedor);
app.delete('/proveedores/:idProveedor', proveedoresController.eliminarProveedor);

// Rutas controladores de productos
app.get('/productos', productoController.getProductos);
app.post('/productos', productoController.guardarProducto);
app.put('/productos/:idProducto', productoController.editarProducto);
app.delete('/productos/:idProducto', productoController.eliminarProducto);

// Rutas controladores de categorias
app.get('/categorias', categoriaController.getCategorias);  
app.post('/categorias', categoriaController.guardarCategoria);
app.put('/categorias/:idCategoria', categoriaController.editarCategoria);
app.delete('/categorias/:idCategoria', categoriaController.eliminarCategoria);

// Rutas controladores de stock

app.get('/stock', stockController.getStockArticulos);


app.listen(port, () => {
  console.log(`La Torre Lib's está corriendo en http://localhost:${port}`);
});
