const sql = require('mssql');
const dbConfig = require('../database/dbConfig');

// Obtener los productos desde la base de datos
const getProductos = async (req, res) => {
  try {
    await sql.connect(dbConfig);

    const result = await sql.query('SELECT * FROM producto');

    res.json(result.recordset);
  } catch (error) {
    console.error('Error al obtener los productos', error);
    res.status(500).json({ error: 'Error al obtener los productos' });
  }
};

// Guardar un producto en la base de datos
const guardarProducto = async (req, res) => {
  try {
    const { descripcion, estado, nombre, id_categoria } = req.body;

    await sql.connect(dbConfig);

    await sql.query(
      `INSERT INTO producto (Descripcion, Estado, Nombre, Id_Categoria) VALUES ('${descripcion}', ${estado}, '${nombre}', '${id_categoria}')`
    );

    res.status(201).json({ message: 'Producto guardado exitosamente' });
  } catch (error) {
    console.error('Error al guardar el producto', error);
    res.status(500).json({ error: 'Error al guardar el producto' });
  }
};

// Editar un producto en la base de datos
const editarProducto = async (req, res) => {
  try {
    const id = req.params.idProducto;
    const { descripcion, estado, nombre, id_categoria } = req.body;

    await sql.connect(dbConfig);

    await sql.query(
      `UPDATE producto SET Descripcion = '${descripcion}', Estado = ${estado}, Nombre = '${nombre}', Id_Categoria = '${id_categoria}' WHERE Id_Producto = ${id}`
    );

    res.json({ message: 'Producto editado exitosamente', id, descripcion, estado, nombre, id_categoria });
  } catch (error) {
    console.error('Error al editar el producto', error);
    res.status(500).json({ error: 'Error al editar el producto' });
  }
};

// Eliminar un producto de la base de datos
const eliminarProducto = async (req, res) => {
  try {
    const id = req.params.idProducto;

    await sql.connect(dbConfig);

    await sql.query(`DELETE FROM producto WHERE Id_Producto = ${id}`);

    res.json({ message: 'Producto eliminado exitosamente' });
  } catch (error) {
    console.error('Error al eliminar el producto', error);
    res.status(500).json({ error: 'Error al eliminar el producto' });
  }
};

module.exports = {
  getProductos,
  guardarProducto,
  editarProducto,
  eliminarProducto
};
