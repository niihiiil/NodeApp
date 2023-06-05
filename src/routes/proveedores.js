// routes/proveedores.js
const express = require('express');
const router = express.Router();

// Ruta para mostrar el formulario de agregar proveedor
router.get('/agregar', (req, res) => {
  res.render('agregarProveedor');
});

// Ruta para procesar el formulario de agregar proveedor
router.post('/', (req, res) => {
  // Aquí puedes agregar la lógica para guardar la información del proveedor en tu base de datos
  const { nombre, numero, direccion, marca } = req.body;
  // ... realizar el proceso de guardado en la base de datos ...

  // Redireccionar a la página de proveedores o mostrar un mensaje de éxito
  res.redirect('/proveedores');
});

module.exports = router;
