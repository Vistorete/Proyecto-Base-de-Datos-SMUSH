const mysql = require('mysql'); //Importa mysql
const { promisify } = require('util');

const { database } = require('./keys'); //Importa la base de datos desde el archivo keys


const pool = mysql.createPool(database); //Genera una conexión a la base de datos

pool.getConnection((err, connection) => { //Se usa para mantener la conexión
    if (err){
        if (err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.error('DATABASE CONNECTION WAS CLOSED');
        }
        if (err.code === 'ER_CON_COUNT_ERROR'){
            console.error('DATABASE HAS TOO MANY CONNECTIONS');
        }
        if (err.code === 'ECONNREFUSED'){
            console.error('DATABASE CONNECTION WAS REFUSED');
        }
    }
    //Si no hay errores empieza la conexión
    if (connection) connection.release();
    console.log('DB is Connected');
    return;
}); 

//Promisify Pool Querys
pool.query = promisify(pool.query);

module.exports = pool; //Se exporta pool para la conexión y poder hacer las consultas