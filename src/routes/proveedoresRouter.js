const express = require('express');
const router = express.Router();

// Ruta para la vista de Proveedores
router.get('/', (req, res) => {
  res.render('proveedores');
});

module.exports = router;
