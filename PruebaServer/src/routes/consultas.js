const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'database_smush'
});

con.connect(function(err){
    if(err) throw err;
});

var equipos;

router.get('/', async (req, res) => {
    con.query('SELECT * FROM equipos', function(err,result,fields){
        if(err) throw err;
        equipos = result;
    });

    res.render('links/index', {equipos}); //Renderiza el teams.hbs
});

module.exports = router;