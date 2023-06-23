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

// Guardar un proveedor en la base de datos
const guardarProveedor = async (req, res) => {
  try {
    const { nombre, direccion, telefono } = req.body;

    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para guardar el proveedor
    await sql.query(
      `INSERT INTO proveedor (nombre, direccion, telefono) VALUES ('${nombre}', '${direccion}', '${telefono}')`
    );

    res.status(201).json({ message: 'Proveedor guardado exitosamente' });
  } catch (error) {
    console.error('Error al guardar el proveedor', error);
    res.status(500).json({ error: 'Error al guardar el proveedor' });
  }
};

// Editar un proveedor en la base de datos
const editarProveedor = async (req, res) => {
  try {
    const { id } = req.params;
    const { nombre, direccion, telefono } = req.body;

    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para editar el proveedor
    await sql.query(
      `UPDATE proveedor SET nombre = '${nombre}', direccion = '${direccion}', telefono = '${telefono}' WHERE id = ${id}`
    );

    res.json({ message: 'Proveedor editado exitosamente' });
  } catch (error) {
    console.error('Error al editar el proveedor', error);
    res.status(500).json({ error: 'Error al editar el proveedor' });
  }
};

// Eliminar un proveedor de la base de datos
const eliminarProveedor = async (req, res) => {
  try {
    const { id } = req.params;

    // Conectar a la base de datos
    await sql.connect(dbConfig);

    // Realizar la consulta para eliminar el proveedor
    await sql.query(`DELETE FROM proveedor WHERE id = ${id}`);

    res.json({ message: 'Proveedor eliminado exitosamente' });
  } catch (error) {
    console.error('Error al eliminar el proveedor', error);
    res.status(500).json({ error: 'Error al eliminar el proveedor' });
  }
};

module.exports = {
  getProveedores,
  guardarProveedor,
  editarProveedor,
  eliminarProveedor
};