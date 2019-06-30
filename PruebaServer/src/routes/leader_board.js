const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "database_smush"
});
var users;
con.connect(function(err){
    if(err) throw err;
    con.query("SELECT * FROM (SELECT users.id, users.username , (count(case WHEN partidas.score_jugador1 > partidas.score_jugador2 AND partidas.id_jugador1=users.id THEN 1 END) + count(case WHEN partidas.score_jugador1 < partidas.score_jugador2 AND partidas.id_jugador2=users.id THEN 1 END))/   count(case WHEN partidas.id_jugador1=users.id or partidas.id_jugador2=users.id THEN 1 END) * 100 AS winrate FROM partidas, users GROUP BY users.id ORDER BY winrate DESC) AS LEADER_BOARD WHERE LEADER_BOARD.winrate IS NOT NULL", function(err, result, fields){
        if(err) throw err;
        //console.log(result);
        leader_board=result;
    });
});


router.get('/', async (req, res) => {
    res.render('links/leader_board');
    //const leader = await pool.query('SELECT * FROM (SELECT users.id, users.username , (count(case WHEN partidas.score_jugador1 > partidas.score_jugador2 AND partidas.id_jugador1=users.id THEN 1 END) +   count(case WHEN partidas.score_jugador1 < partidas.score_jugador2 AND partidas.id_jugador2=users.id THEN 1 END))/  count(case WHEN partidas.id_jugador1=users.id or partidas.id_jugador2=users.id THEN 1 END) * 100 AS winrate    FROM partidas, users   GROUP BY users.id ORDER BY winrate DESC) AS LEADER_BOARD WHERE LEADER_BOARD.winrate IS NOT NULL');
    //const users = await pool.query('SELECT * FROM users');
    console.log(leader_board);
});

router.post('/', async (req, res) => {
    res.send('');
});

module.exports = router;