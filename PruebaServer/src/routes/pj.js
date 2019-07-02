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
module.exports = router; //Exporta el objeto router
