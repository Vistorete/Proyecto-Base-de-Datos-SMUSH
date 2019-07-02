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
var pj;
router.get('/', async (req, res) => {
    await con.query("SELECT * FROM personajes",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/pj',{pj});
    //console.log(tournaments);
});
router.get('/poppj', async (req, res) => {
    await con.query("SELECT personajes.nombre, count(case WHEN juegos.pj1=personajes.id THEN 1 END) + count(case WHEN juegos.pj2=personajes.id THEN 1 END) as total from personajes, juegos GROUP BY personajes.id ORDER BY total DESC",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/poppj',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
var tour
router.get('/captour', async (req, res) => {
    await con.query("select torneos.nombre, locales.capacidad from locales,torneos where torneos.id_local = locales.id",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        tour=result;
    });
    res.render('links/captour',{tour});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
router.get('/mineq', async (req, res) => {
    await con.query("select equipos.nombre from equipos where equipos.id = (select E.id_equipo from (select users.id_equipo , count(users.id) C from users group by users.id_equipo) as E where E.C= (select min(f.contador) from (select users.id_equipo , count(users.id) contador  from users group by users.id_equipo)as f))",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/mineq',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
router.get('/nextour', async (req, res) => {
    await con.query("select torneos.nombre, torneos.fecha from torneos where torneos.fecha > SYSDATE() order by torneos.fecha",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/nextour',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
router.get('/jsneq', async (req, res) => {
    await con.query("select users.fullname, users.username from users where users.id_equipo is NULL",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/jsneq',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});


router.get('/userorg/:id', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("SELECT users.username, users.fullname, torneos.nombre, torneos.id, locales.nombre as nombreL FROM torneos, users, locales WHERE locales.id = torneos.id_local and torneos.id_organizador = ? and users.id=?",[id,id],function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/userorg',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
//-----------------------------------------------------------------------------------------------------------------------------
});

router.get('/mapaspop', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select * from (select mapas.nombre , count(*) as cuenta from mapas , juegos where mapas.id = juegos.mapa group by mapas.id) as E order by E.cuenta desc",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/mapaspop',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-------------------------------pais ganador de torneo----------------------------------------------------------------
router.get('/pagan', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select users.pais from users,resultados where resultados.posicion = 1 and users.id = resultados.id_user",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/pagan',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-------------------------------puestos destacados-------------------------------------------------------------------------------------------

router.get('/topplay', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select users.fullname, resultados.posicion from users,resultados where users.id = resultados.id_user and (resultados.posicion = 1 or resultados.posicion = 2 or resultados.posicion = 3) order by resultados.posicion",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/topplay',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-----------------------------------capacidad locales---------------------------------------------------------------------------------------

router.get('/caploc', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select locales.nombre, locales.capacidad from locales where locales.capacidad=(select max(locales.capacidad) from locales)",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/caploc',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-----------------------------------pais con mas jugadores---------------------------------------------------------------------------------------

router.get('/maypais', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select E.pais, E.contarp from (select users.pais , count(users.id) contarp from users group by users.pais) as E where E.contarp = (select max(A.P) from (select users.pais , count(users.id) P from users group by users.pais)as A)",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/maypais',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-----------------------------------max rondas---------------------------------------------------------------------------------------

router.get('/mrondas', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select torneos.nombre, max(partidas.num_ronda) p from partidas,torneos where torneos.nombre = 'EVOLUTION 2019' and partidas.id_torneo = torneos.id",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/mrondas',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-----------------------------------miembros team alpha---------------------------------------------------------------------------------------

router.get('/malpha', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select users.fullname, users.username from users, equipos where equipos.id=users.id_equipo and equipos.nombre='Alpha'",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/malpha',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-----------------------------------numero de participantes en un torneo--------------------------------------------------------------------------------------

router.get('/npdream2019', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select torneos.nombre, count(resultados.id_user) c from resultados,torneos where torneos.nombre='DREAM HACK 2019' and torneos.id=resultados.id_torneo	",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/npdream2019',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
//-----------------------------------personaje mas jugado---------------------------------------------------------------------------------------

router.get('/toppj', async (req, res) => {
    const id = req.params.id;
    console.log(id)

    await con.query("select a.nombre  from ((select count(*) n , personajes.nombre from personajes,juegos,partidas,users where (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2) and juegos.id_partida = partidas.id and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2) group by (personajes.nombre))as a)  where a.n = (select max(a.n) from ((select count(*) n , personajes.nombre from personajes,juegos,partidas,users where (users.id = partidas.id_jugador1 or users.id = partidas.id_jugador2) and juegos.id_partida = partidas.id and (personajes.id = juegos.pj1 or personajes.id = juegos.pj2) group by (personajes.nombre))as a)) ",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/toppj',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});

module.exports = router; //Exporta el objeto router
