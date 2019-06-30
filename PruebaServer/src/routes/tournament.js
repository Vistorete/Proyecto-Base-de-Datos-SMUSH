const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "database_smush"
});

var tournaments;


con.connect(function(err){
    if(err) throw err;
    con.query("SELECT * FROM torneos",function(err,result,fields){
        if(err) throw err;
        console.log(result);
        tournaments=result;
    });
});

router.get('/', async (req, res) => {
    res.render('links/tournament',{tournaments});
    console.log(tournaments);
});


module.exports = router; //Exporta el objeto router