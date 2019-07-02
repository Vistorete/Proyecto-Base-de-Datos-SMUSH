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
router.get('/pop', async (req, res) => {
    await con.query("SELECT personajes.nombre, count(case WHEN juegos.pj1=personajes.id THEN 1 END) + count(case WHEN juegos.pj2=personajes.id THEN 1 END) as total from personajes, juegos GROUP BY personajes.id ORDER BY total DESC",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        pj=result;
    });
    res.render('links/poppj',{pj});
    //res.send("asbdkasdasd");
    //console.log(tournaments);
});
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
module.exports = router; //Exporta el objeto router
