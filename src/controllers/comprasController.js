const sql = require('mssql');
const dbConfig = require('../database/dbConfig');

// Obtener las compras desde la base de datos
const getCompras = async (req, res) => {
  try {
    await sql.connect(dbConfig);

    const result = await sql.query('SELECT * FROM Compra');

    res.json(result.recordset);
  } catch (error) {
    console.error('Error al obtener las compras', error);
    res.status(500).json({ error: 'Error al obtener las compras' });
  }
};

const guardarCompra = async (req, res) => {
  try {
    const { Id_Proveedor, Fecha_Compra, Total, Id_Usuario, Sub_Total, IVA, Descuento, Estado } = req.body;

    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para guardar la compra
    await sql.query(
      `INSERT INTO Compra (Id_Proveedor, Fecha_Compra, Total, Id_Usuario, Sub_Total, IVA, Descuento, Estado) 
      VALUES (${Id_Proveedor}, '${Fecha_Compra}', ${Total}, ${Id_Usuario}, ${Sub_Total}, ${IVA}, ${Descuento}, ${Estado})`
    );

    res.status(201).json({ message: 'Compra guardada exitosamente' });
  } catch (error) {
    console.error('Error al guardar la compra', error);
    res.status(500).json({ error: 'Error al guardar la compra' });
  }
};

// Editar una compra en la base de datos
const editarCompra = async (req, res) => {
  try {
    const { id } = req.params;
    const { Id_Proveedor, Fecha_Compra, Total, Id_Usuario, Sub_Total, IVA, Descuento, Estado } = req.body;

    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para editar la compra
    await sql.query(
      `UPDATE Compra SET Id_Proveedor = ${Id_Proveedor}, Fecha_Compra = '${Fecha_Compra}', Total = ${Total}, 
      Id_Usuario = ${Id_Usuario}, Sub_Total = ${Sub_Total}, IVA = ${IVA}, Descuento = ${Descuento}, Estado = ${Estado} 
      WHERE Id_Compra = ${id}`
    );

    res.json({ message: 'Compra editada exitosamente' });
  } catch (error) {
    console.error('Error al editar la compra', error);
    res.status(500).json({ error: 'Error al editar la compra' });
  }
};

// Eliminar una compra de la base de datos
const eliminarCompra = async (req, res) => {
  try {
    const { id } = req.params;

    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para eliminar la compra
    await sql.query(`DELETE FROM Compra WHERE Id_Compra = ${id}`);

    res.json({ message: 'Compra eliminada exitosamente' });
  } catch (error) {
    console.error('Error al eliminar la compra', error);
    res.status(500).json({ error: 'Error al eliminar la compra' });
  }
};

module.exports = {
  getCompras,
  guardarCompra,
  editarCompra,
  eliminarCompra
};
