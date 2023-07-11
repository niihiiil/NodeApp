const sql = require('mssql');
const dbConfig = require('../database/dbConfig');

// Obtener las categorías desde la base de datos
const getCategorias = async (req, res) => {
  try {
    await sql.connect(dbConfig);

    const result = await sql.query('SELECT * FROM categoria');

    res.json(result.recordset);
  } catch (error) {
    console.error('Error al obtener las categorías', error);
    res.status(500).json({ error: 'Error al obtener las categorías' });
  }
};

// Guardar una categoría en la base de datos
const guardarCategoria = async (req, res) => {
  try {
    const { nombre, estado } = req.body;

    await sql.connect(dbConfig);

    await sql.query(
      `INSERT INTO categoria (Nombre, Estado) VALUES ('${nombre}', '${estado}')`
    );

    res.status(201).json({ message: 'Categoría guardada exitosamente' });
  } catch (error) {
    console.error('Error al guardar la categoría', error);
    res.status(500).json({ error: 'Error al guardar la categoría' });
  }
};

// Editar una categoría en la base de datos
const editarCategoria = async (req, res) => {
  try {
    const id = req.params.idCategoria;
    const { nombre, estado } = req.body;

    await sql.connect(dbConfig);

    await sql.query(
      `UPDATE categoria SET Nombre = '${nombre}', Estado = '${estado}' WHERE Id_Categoria = ${id}`
    );

    res.json({ message: 'Categoría editada exitosamente', id, nombre, estado });
  } catch (error) {
    console.error('Error al editar la categoría', error);
    res.status(500).json({ error: 'Error al editar la categoría' });
  }
};

// Eliminar una categoría de la base de datos
const eliminarCategoria = async (req, res) => {
  try {
    const id = req.params.idCategoria;

    await sql.connect(dbConfig);

    await sql.query(`DELETE FROM categoria WHERE Id_Categoria = ${id}`);

    res.json({ message: 'Categoría eliminada exitosamente' });
  } catch (error) {
    console.error('Error al eliminar la categoría', error);
    res.status(500).json({ error: 'Error al eliminar la categoría' });
  }
};

module.exports = {
  getCategorias,
  guardarCategoria,
  editarCategoria,
  eliminarCategoria
};
