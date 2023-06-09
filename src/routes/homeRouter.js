const express = require('express');
const router = express.Router();

// Ruta para la vista Home
router.get('/', (req, res) => {
  res.render('home');
});

module.exports = router;
