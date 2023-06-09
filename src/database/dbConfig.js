const config = {
    user: 'sa',
    password: '1234',
    server: 'localhost',
    database: 'BDproyectolibreria',
    "port": 1433, // make sure to change port
    "dialect": "mssql",
    "dialectOptions": {
        "instanceName": "SQLEXPRESS",
    }
  };
  
  module.exports = config;
  