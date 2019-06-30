const express = require('express'); //Se usa para crear las rutas
const router = express.Router(); //Se usa el método de la ruta llamado "Router" que lo convierte en un objeto

router.get('/', async (req, res) => { //Se define una ruta y muestra "Hello World"
    res.render('links/leader_board');
    //const leader = await pool.query('SELECT * FROM (SELECT users.id, users.username , (count(case WHEN partidas.score_jugador1 > partidas.score_jugador2 AND partidas.id_jugador1=users.id THEN 1 END) +   count(case WHEN partidas.score_jugador1 < partidas.score_jugador2 AND partidas.id_jugador2=users.id THEN 1 END))/  count(case WHEN partidas.id_jugador1=users.id or partidas.id_jugador2=users.id THEN 1 END) * 100 AS winrate    FROM partidas, users   GROUP BY users.id ORDER BY winrate DESC) AS LEADER_BOARD WHERE LEADER_BOARD.winrate IS NOT NULL');
    const users = await pool.query('SELECT * FROM users');

    
    console.log(users);
});

router.post('', async (req, res) => { //Se define una ruta y muestra "Hello World"
    res.send('recivido');
});

module.exports = router; //Exporta el objeto router