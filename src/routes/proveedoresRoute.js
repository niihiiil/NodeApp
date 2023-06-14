const express = require('express');
const router = express.Router();

// Importa el controlador de proveedores
const proveedoresController = require('../controllers/proveedoresController');

// Ruta para obtener la lista de proveedores
router.get('/proveedores.html', proveedoresController.obtenerListaProveedores);

module.exports = router;
