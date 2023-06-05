const express = require('express');
const router = express.Router();

// Importar las rutas individuales
const proveedoresRouter = require('./proveedores');
const stockRouter = require('./stock');
const ventasRouter = require('./ventas');
const comprasRouter = require('./compras');

// Configurar las rutas
router.use('/proveedores', proveedoresRouter);
router.use('/stock', stockRouter);
router.use('/ventas', ventasRouter);
router.use('/compras', comprasRouter);

// Ruta para la URL raíz "/"
router.get('/', (req, res) => {
  res.render('home');
});

module.exports = router;
