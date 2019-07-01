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
    await con.query("SELECT torneos.id_organizador, torneos.id, users.username, torneos.nombre, torneos.fecha, locales.direccion FROM users, torneos, locales WHERE users.id=torneos.id_organizador and locales.id=torneos.id_local ORDER BY torneos.fecha;",function(err,result,fields){
        if(err) throw err;
        //console.log(result);
        tournaments=result;
    });
    res.render('links/tournament',{tournaments});
    //console.log(tournaments);

});
router.post('/',async(req,res)=>{
    const {id_organizador, nombre, id_local, fecha} = req.body;
    const nuevoTorneo = {
        id_organizador,
        nombre,
        id_local,
        fecha
    };
    await con.query("INSERT INTO torneos set ?",[nuevoTorneo]);
    res.redirect('/tournament');
});

router.get('/delete/:id',async(req,res)=>{
    const id = req.params.id;
    await con.query('DELETE FROM torneos WHERE id = ?',[id]);
    //await con.query("DELETE FROM partidas WHERE id_torneo = ?",[id]);
    await con.query('DELETE FROM partidas WHERE partidas.id_torneo=?',[id] ,function(err,result,fields){
        if(err) throw err;
        console.log(result);
    });
    await res.redirect('/tournament');
});

router.get('/info/:id',async(req,res)=>{
    const id = req.params.id;
    res.send("id de torneo: "+id);
});

module.exports = router; //Exporta el objeto router