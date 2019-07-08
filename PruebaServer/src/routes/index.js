const express = require('express'); //Se usa para crear las rutas
const router = express.Router(); //Se usa el método de la ruta llamado "Router" que lo convierte en un objeto
var mysql = require('mysql');


var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'database_smush'
});
router.get('/', (req, res) => { //Se define una ruta y muestra la portada creada
    res.render('links/portada');
});

module.exports = router; //Exporta el objeto router