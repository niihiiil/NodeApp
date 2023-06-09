const express = require('express');
const sql = require('mssql');
const dbConfig = require('./database/dbConfig'); // Importar la configuración de la base de datos

const app = express();
const port = 3000;



// Establecer la conexión con SQL Server
const connectionConfig = {
  ...dbConfig,
  options: {
    encrypt: false // Ignorar errores de certificado
  }
};

sql.connect(connectionConfig)
  .then(() => console.log('Conexión exitosa con SQL Server'))
  .catch((err) => console.error('Error al conectar con SQL Server', err));

// Configurar la ruta para la vista Home
app.get('/', (req, res) => {
  res.render('home');
});

// Configurar la ruta para la vista de proveedores
app.get('/proveedores', (req, res) => {
  // Obtener los proveedores de la base de datos
  // ...

  res.render('proveedores', { proveedores: proveedores });
});

// Configurar la ruta para agregar proveedores
app.post('/proveedores/agregar', (req, res) => {
  // Obtener los datos del formulario
  const { nombre, telefono, direccion, estado } = req.body;

  // Insertar los datos en la base de datos
  // ...

  res.redirect('/proveedores');
});


// Configurar rutas estáticas
app.use(express.static(__dirname + '/public'));

// Configurar el motor de vistas EJS
app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');

// Iniciar el servidor
app.listen(port, () => {
  console.log(`La Torre Lib's está corriendo en http://localhost:${port}`);
});
