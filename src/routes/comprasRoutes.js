const express = require('express');
const router = express.Router();
const comprasController = require('../controllers/comprasController');

router.get('/compras', comprasController.getCompras);
router.post('/compras', comprasController.guardarCompra);
router.put('/compras/:id', comprasController.editarCompra);
router.delete('/compras/:id', comprasController.eliminarCompra);

module.exports = router;
