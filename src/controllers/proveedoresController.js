const sql = require('mssql');
const dbConfig = require('../database/dbConfig');

// Obtener los proveedores desde la base de datos
const getProveedores = async (req, res) => {
  try {
    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para obtener los proveedores
    const result = await sql.query('SELECT * FROM proveedor');

    // Enviar los proveedores como respuesta
    res.json(result.recordset);
  } catch (error) {
    console.error('Error al obtener los proveedores', error);
    res.status(500).json({ error: 'Error al obtener los proveedores' });
  } 
};

module.exports = { getProveedores };
