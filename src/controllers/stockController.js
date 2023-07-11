const sql = require('mssql');
const dbConfig = require('../database/dbConfig');

// Obtener los registros de stock_articulos desde la base de datos
const getStockArticulos = async (req, res) => {
  try {
    await sql.connect(dbConfig);

    const result = await sql.query('SELECT * FROM stock_articulos');

    res.json(result.recordset);
  } catch (error) {
    console.error('Error al obtener los registros de stock_articulos', error);
    res.status(500).json({ error: 'Error al obtener los registros de stock_articulos' });
  }
};

module.exports = {
  getStockArticulos
};
