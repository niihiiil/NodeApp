const express = require('express');
const router = express.Router();
const categoriaController = require('../controllers/categoriaController');

router.get('/categorias', categoriaController.getCategorias);
router.post('/categorias', categoriaController.guardarCategoria);
router.put('/categorias/:id', categoriaController.editarCategoria);
router.delete('/categorias/:id', categoriaController.eliminarCategoria);


module.exports = router;
