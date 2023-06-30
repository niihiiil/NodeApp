const sql = require('mssql');
const dbConfig = require('../database/dbConfig');

//obtener compras
const getCompras = async (req, res) => {
  try {

    await sql.connect(dbConfig);
    const result = await sql.query('SELECT * FROM Compra');
    res.json(result.recordset);
  }catch(error){
    console.error('Error al obtener las compras', error);
    res.status(500).json({error: 'Error al obtener las compras'});
  }
  };

  //guardar compra

  const guardarCompra = async (req, res) => {
    try {
      const { idProveedor, fecha, total, subtotal, descuento, estado } = req.body;
      await sql.connect(dbConfig);
      await sql.query(
        `INSERT INTO Compra (Id_Proveedor, Fecha_Compra, Total, Sub_Total, Descuento, Estado) VALUES ('${idProveedor}', '${fecha}', '${total}', '${subtotal}', '${descuento}', '${estado}')`
        );

        res.status(201).json({ message: 'Compra guardada exitosamente' });
      } catch (error) {
        console.error('Error al guardar la compra', error);
        res.status(500).json({ error: 'Error al guardar la compra' });
      }
    };

    const editarCompra = async (req, res) => {
      try {
        const id = req.params.idCompra;
        const { idProveedor, fecha, total, subtotal, descuento, estado } = req.body;
        await sql.connect(dbConfig);
        await sql.query(
          `UPDATE Compra SET Id_Proveedor = '${idProveedor}', Fecha_Compra = '${fecha}', Total = '${total}', Subtotal = '${subtotal}', Descuento = '${descuento}', Estado = '${estado}' WHERE Id_Compra = ${id}`
        );

        res.json({ message: 'Compra editada exitosamente', idProveedor, fecha, total, subtotal, descuento, estado });
      } catch (error) { 
        res.status(500).json({ error: 'Error al editar la compra' });
      }
    };

    const eliminarCompra = async (req, res) => {
      try {
        const id = req.params.idCompra;
        await sql.connect(dbConfig);
        await sql.query(`DELETE FROM Compra WHERE Id_Compra = ${id}`);
        res.json({ message: 'Compra eliminada exitosamente', id });
      } catch (error) {
        console.error('Error al eliminar el proveedor', error);
        res.status(500).json({ error: 'Error al eliminar la compra', req: req.params });
      }
    };

    module.exports = {
      getCompras,
      guardarCompra,
      editarCompra,
      eliminarCompra
    }
