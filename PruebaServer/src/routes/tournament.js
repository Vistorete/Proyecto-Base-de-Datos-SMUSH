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
    await con.query("SELECT torneos.id_organizador, torneos.id, users.username, torneos.nombre, torneos.fecha, locales.direccion FROM users, torneos, locales WHERE users.id=torneos.id_organizador and locales.id=torneos.id_local ORDER BY torneos.fecha",function(err,result,fields){
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


var p_torneo;
router.get('/info/:id',async(req,res)=>{
    const id_torneo = req.params.id;
    await con.query("SELECT p1.id_torneo, p1.id, p1.username as user1,p1.score_jugador1,p2.score_jugador2,  p2.username as user2, p1.num_ronda FROM (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador1, partidas.score_jugador1, partidas.num_ronda    FROM users, partidas    WHERE users.id=partidas.id_jugador1) as p1,   (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador2, partidas.score_jugador2    FROM users, partidas    WHERE users.id=partidas.id_jugador2) as p2 WHERE p1.id=p2.id AND p1.id_torneo = ?",[id_torneo],function(err,result,fields){
        if(err) throw err;
        p_torneo = result;
        console.log(result);
    });
    res.render('links/t_info',{p_torneo});
});

module.exports = router; //Exporta el objeto router
