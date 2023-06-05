// src/app.js
const express = require('express');
const app = express();
const path = require('path');

// Configurar vistas con EJS
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Configurar carpeta estática
app.use(express.static(path.join(__dirname, 'public')));

// Ruta para la URL raíz
app.get('/', (req, res) => {
  res.render('home');
});

// src/app.js
app.use(express.static(path.join(__dirname, 'public')));

// ... otras rutas ...

// Iniciar el servidor
const port = 3000;
app.listen(port, () => {
  console.log(`Servidor iniciado en http://localhost:${port}`);
});
