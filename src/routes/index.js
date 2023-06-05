const express = require('express');
const router = express.Router();

// Importar las rutas individuales
const indexRouter = require('./index');

// Configurar las rutas
router.use('/', indexRouter);

module.exports = router;
