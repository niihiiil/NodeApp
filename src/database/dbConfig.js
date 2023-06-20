const config = {
    user: 'sa',
    password: '1234',
    server: 'localhost',
    database: 'BDproyectolibreria',
    "port": 1432, // port from ssms
    "dialect": "mssql",
    "dialectOptions": {
        "instanceName": "CRYPTOHEGELIAN\\SQLSERVER",
    }
  };
  
  module.exports = config;
  