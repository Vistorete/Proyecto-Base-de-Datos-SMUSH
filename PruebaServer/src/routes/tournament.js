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

router.post('/',async(req,res) => {
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
    await con.query('DELETE FROM partidas WHERE partidas.id_torneo=?',[id]);
    await res.redirect('/tournament');
});


var p_torneo;
var torneo;
var rondas;
var participantes;
router.get('/info/:id',async(req,res)=>{
    const id_torneo = req.params.id;


    console.log('Informacion del torneo... ' + id_torneo);
// Datos basicos del torneo
    await con.query('SELECT * FROM torneos WHERE torneos.id = ?',[id_torneo],function(err,result,fields){
        if(err) throw err;
        torneo = result;
        //console.log(torneo);
    });

    await con.query('SELECT partidas.num_ronda AS ronda FROM partidas WHERE partidas.id_torneo = ? GROUP BY partidas.num_ronda ORDER BY partidas.num_ronda',[id_torneo],function(err,result,fields){
        if(err) throw err;
        rondas = result;
        //console.log(torneo);
    });
    await con.query('SELECT * FROM resultados,users WHERE resultados.id_torneo= ? and users.id=resultados.id_user ORDER BY resultados.posicion',[id_torneo],function(err,result,fields){
        if(err) throw err;
        participantes = result;
        //console.log(torneo);
    });
    await con.query("SELECT p1.id_torneo, p1.id, p1.username as user1,p1.score_jugador1,p2.score_jugador2,  p2.username as user2, p1.num_ronda FROM (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador1, partidas.score_jugador1, partidas.num_ronda    FROM users, partidas    WHERE users.id=partidas.id_jugador1) as p1,   (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador2, partidas.score_jugador2    FROM users, partidas    WHERE users.id=partidas.id_jugador2) as p2 WHERE p1.id=p2.id AND p1.id_torneo = ?",[id_torneo],function(err,result,fields){
        if(err) throw err;
        p_torneo = result;
        //console.log(result);
    });
    //console.log(p_torneo);
    //console.log(participantes);
    //console.log({p_torneo,torneo,rondas,participantes});

    res.render('links/t_info',{p_torneo, torneo,rondas,participantes,id_torneo});
});

router.get('/info/info/:id',async(req,res)=>{
    const id_tor = req.params.id;
    await con.query("SELECT juegos.id_partida, juegos.num_match, p1.nombre1,p2.nombre2,mapas.nombre from juegos,mapas,(select personajes.id,personajes.nombre as nombre1 from personajes)as p1, (select personajes.id,personajes.nombre as nombre2 from personajes)as p2 where p1.id=juegos.pj1 and p2.id=juegos.pj2 and juegos.mapa=mapas.id and juegos.id_partida=?",[id_tor],function(err,result,fields){
        if(err) throw er1r;
        p_torneo = result;
        console.log(result);
    });
    res.render('links/t_infoinfo',{p_torneo,id_tor});
});

router.post('/info/info/:id',async(req,res)=>{
    const {num_match, pj1, pj2, mapa} = req.body;
    const id_partida = req.params.id;
    const juego = {id_partida, num_match, pj1, pj2, mapa};
    console.log(juego);
    await con.query("INSERT INTO juegos SET ?",[juego],function(err){
        if(err){
            console.log('hay un error');
            //res.send('Ya esta inscrito');
            return;
        }else{
            //console.log(participante);
            //res.send('Inscrito correctamente');
        };
    } );
    var url = ('/tournament/info/info/'+id_partida);
    console.log(url);  
    res.redirect(url);
});
router.post('/info/add/:id',async(req,res)=>{
    const {id_user} = req.body;
    const id_torneo = req.params.id;
    const participante = {id_torneo,id_user};
    console.log(participante);

    await con.query("INSERT INTO resultados set ?",[participante],function(err){
        if(err){
            console.log('hay un error');
            //res.send('Ya esta inscrito');
            return;
        }else{
            //console.log(participante);
            //res.send('Inscrito correctamente');
        };
    });
    var url = ('/tournament/info/'+id_torneo);
    res.redirect(url);
});

var respuesta1;
var respuesta2;
var ver;

router.post('/info/game/:id',async function(req,res){
    const {id_jugador1, id_jugador2, score_jugador1, score_jugador2, num_ronda} = req.body;
    const id_torneo = req.params.id;
    const nuevaPartida={id_torneo, id_jugador1, id_jugador2, score_jugador1, score_jugador2, num_ronda};

    await con.query("SELECT IF(count(*) != 0,'True', 'False') as PUEDE FROM resultados WHERE resultados.id_user= ? and resultados.id_torneo = ?",[id_jugador1,id_torneo],function(err,result,fields){
        if(err) throw err;
        respuesta1 = result;
        //console.log(torneo);
    });
    await con.query("SELECT IF(count(*) != 0,'True', 'False') as PUEDE FROM resultados WHERE resultados.id_user= ? and resultados.id_torneo = ?",[id_jugador2,id_torneo],function(err,result,fields){
        if(err) throw err;
        respuesta2 = result;
        //console.log(torneo);
    });
    
    await con.query("SELECT 'True' as PUEDE",function(err,result,fields){
        if(err) throw err;
        ver= result;
        //console.log(torneo);
    });
    console.log(nuevaPartida);


    await con.query("INSERT INTO partidas set ?",[nuevaPartida]);
    await con.query("UPDATE    resultados,(SELECT res.id_torneo, res.perdedor, (POWER(2,(maximo.rondas - res.num_ronda)) + 1) as pos FROM (SELECT partidas.id_torneo AS id_torneo1, MAX(partidas.num_ronda) AS rondas FROM partidas GROUP BY partidas.id_torneo) as maximo, (SELECT partidas.id, partidas.id_torneo,partidas.num_ronda, IF(partidas.score_jugador1 < partidas.score_jugador2, partidas.id_jugador1,partidas.id_jugador2) as perdedor FROM partidas) as res WHERE res.id_torneo = maximo.id_torneo1) AS actualizar SET       resultados.posicion = actualizar.pos WHERE     resultados.id_torneo = actualizar.id_torneo AND       resultados.id_user = actualizar.perdedor and resultados.id_torneo = ?",[id_torneo]);
    await con.query("UPDATE    resultados,(SELECT maximo.id_torneo, IF(partidas.score_jugador1>partidas.score_jugador2,partidas.id_jugador1,partidas.id_jugador2) as ganador, 1 AS pos FROM partidas, (SELECT MAX(partidas.num_ronda) AS rondas, partidas.id_torneo FROM partidas WHERE partidas.id_torneo = ?) maximo WHERE partidas.id_torneo = maximo.id_torneo and maximo.rondas = partidas.num_ronda) AS actualizar SET       resultados.posicion = actualizar.pos WHERE     resultados.id_torneo = actualizar.id_torneo AND       resultados.id_user = actualizar.ganador AND resultados.id_torneo = ?",[id_torneo,id_torneo]);
    var url = ('/tournament/info/'+id_torneo);
    res.redirect(url);
});

var locales;

router.get('/locals', async (req, res) => {
    await con.query("SELECT * FROM locales",function(err,result,fields){
        if (err){
            console.log('hay un error');
        }else{
            console.log("no hay errores");
            locales = result;
            console.log(locales);
        }
    });
    res.render('links/locals',{locales});

    //res.send("aaaaaaaaaaaaaaaaaa");
});


router.post('/locals', async (req, res) => {
    const {nombre, direccion, capacidad} = req.body;
    const nuevoLocal = {nombre, direccion, capacidad};
    console.log(nuevoLocal);

    
    await con.query("INSERT INTO locales SET ?",[nuevoLocal],function(err,result,fields){
        if (err){
            console.log('hay un error');
        }else{
            console.log("no hay errores");
        }
    });
    
    res.redirect('/tournament/locals');
});


module.exports = router; //Exporta el objeto router
