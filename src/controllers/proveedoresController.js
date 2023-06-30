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
    const { nombre, direccion, telefono, estado } = req.body;
    await sql.connect(dbConfig);

    await sql.query(
      `INSERT INTO proveedor (Nombre, Dirección, Telefono, Estado) VALUES ('${nombre}', '${direccion}', '${telefono}', '${estado}')`
    );

    res.status(201).json({ message: 'Proveedor guardado exitosamente' });
  } catch (error) {
    console.error('Error al guardar el proveedor', error);
    res.status(500).json({ error: 'Error al guardar el proveedor' });
  }
};

const editarProveedor = async (req, res) => {
  try {
    const id  = req.params.idProveedor;
    const { nombre, direccion, telefono, estado } = req.body;

    await sql.connect(dbConfig);
    await sql.query(
      `UPDATE proveedor SET Nombre = '${nombre}', Dirección = '${direccion}', Telefono = '${telefono}', Estado = '${estado}' WHERE Id_Proveedor = ${id}`
    );

    res.json({ message: 'Proveedor editado exitosamente', id, nombre, direccion, telefono, estado });
  } catch (error) {
    res.status(500).json({ error: 'Error al editar el proveedor' });
  }
};

const eliminarProveedor = async (req, res) => {
  try {
    const id = req.params.idProveedor;

    await sql.connect(dbConfig);

    await sql.query(`DELETE FROM proveedor WHERE Id_Proveedor = ${id}`);

    res.json({ message: 'Proveedor eliminado exitosamente' });
  } catch (error) {
    console.error('Error al eliminar el proveedor', error);
    res.status(500).json({ error: 'Error al eliminar el proveedor', req: req.params });
  }
};


module.exports = {
  getProveedores,
  guardarProveedor,
  editarProveedor,
  eliminarProveedor
};
