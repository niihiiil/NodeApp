const path = require('path');
const sql = require('mssql');

exports.obtenerListaProveedores = (req, res) => {
  sql.connect(config, (err) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: 'Error de conexión con la base de datos' });
    } else {
      const query = 'SELECT * FROM Proveedor';

      new sql.Request().query(query, (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({ error: 'Error al obtener la lista de proveedores' });
        } else {
          const filePath = path.join(__dirname, '../public/proveedores.html');
          res.sendFile(filePath);
        }
      });
    }
  });
};
