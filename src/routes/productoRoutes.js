const express = require('express');
const router = express.Router();
const productoController = require('../controllers/productoController');

router.get('/productos', productoController.getProductos);
router.post('/productos', productoController.guardarProducto);
router.put('/productos/:id', productoController.editarProducto);
router.delete('/productos/:id', productoController.eliminarProducto);


module.exports = router;
