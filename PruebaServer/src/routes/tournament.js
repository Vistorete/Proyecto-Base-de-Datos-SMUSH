const express = require('express');
const router = express.Router();

var mysql = require('mysql');
//const pool = require('../database');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "database_smush"
});

var tournaments;


con.connect(function(err){
    if(err) throw err;
});

router.get('/', async (req, res) => {
    con.query("SELECT * FROM torneos",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        tournaments=result;
    });
    res.render('links/tournament',{tournaments});
    console.log(tournaments);
});
router.post('/',async(req,res)=>{
    const {id_organizador, nombre, id_local, fecha} = req.body;
    const nuevoTorneo = {
        id_organizador,
        nombre,
        id_local,
        fecha
    };
    var query = await con.query("INSERT INTO torneos set ?",[nuevoTorneo]);
    res.render('links/tournament',{tournaments});
});


module.exports = router; //Exporta el objeto router