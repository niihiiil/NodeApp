const express = require('express');
const router = express.Router();
const proveedorController = require('../controllers/proveedoresController');

router.get('/proveedores', proveedorController.getProveedores);
router.post('/proveedores', proveedorController.guardarProveedor);
router.put('/proveedores/:id', proveedorController.editarProveedor);
router.delete('/proveedores/:id', proveedorController.eliminarProveedor);

module.exports = router;
