const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'database_smush'
});

var users;
var equipos;

con.connect(function(err){
    if(err) throw err;
});

router.get('/', async (req, res) => {
        await con.query('SELECT * FROM users', function(err,result,fields){
        if(err) throw err;
        //console.log(result);
        users=result;
    });

    res.render('links/users', {users});
    //console.log(users);
    //res.send('listo');
});

/*router.get('/', async (req, res) => {
    await con.query('SELECT * FROM equipos', function(err,result,fields){
        if(err) throw err;
        //console.log(result);
        equipos=result;
    });
    res.render('links/users', {equipos});
})*/

router.post('/',async(req,res)=>{
    const { username, fullname, tag, edad, pais} = req.body;
    const newUser = {
        username,
        fullname,
        edad,
        pais
    };
    await con.query("INSERT INTO users set ?",[newUser]);
    res.redirect('/users');
});

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    await con.query('SELECT FROM users WHERE id = ?', [id]);
    res.send(res.params.id);
    //res.redirect('/users');
});

router.get('/delete/:id', async (req, res) => { //Función para borrar usuario
    const id = req.params.id;
    await con.query('DELETE FROM users WHERE id = ?', [id]);
    res.redirect('/users'); //Redirecciona a users.hbs
});

var users2;

router.get('/edit/:id', async (req, res) => { //Función para obtener el usuario a editar
    const { id } = req.params;
    await con.query('SELECT * FROM users WHERE id = ?', [id], function(err,result,fields){
        if(err) throw err
        users2 = result;
    });
    //console.log(users2);
    res.render('links/user_edit', {users2});
});

router.post('/edit/:id', async (req, res) => { //Función para editar el usuario obtenido
    const { id } = req.params;
    const { username, fullname, edad, pais} = req.body;
    const newUser = {
        username,
        fullname,
        edad,
        pais
    };
    await con.query('UPDATE users set ? WHERE id = ?', [newUser, id]);
    //res.send('hola');
    res.redirect('/users');
});

var partidas;
router.get('/profile/:id', async(req, res) => {
    const { id } = req.params;
    await con.query('SELECT * FROM users WHERE id = ?', [id], function(err,result,fields){
        if(err) throw err
        users2 = result;
    });
    await con.query("SELECT p1.id_torneo,torneos.nombre, p1.id, p1.username as user1,p1.score_jugador1,p2.score_jugador2,  p2.username as user2, p1.num_ronda FROM torneos, (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador1, partidas.score_jugador1, partidas.num_ronda    FROM users, partidas    WHERE users.id=partidas.id_jugador1) as p1,   (SELECT partidas.id, partidas.id_torneo, users.username, partidas.id_jugador2, partidas.score_jugador2    FROM users, partidas    WHERE users.id=partidas.id_jugador2) as p2 WHERE p1.id=p2.id AND torneos.id = p1.id_torneo AND (p1.id_jugador1 = ? or p2.id_jugador2 = ?)",[id,id],function(err,result,field){
        if (err) throw err
        partidas = result;
    });
    //console.log(users2);
    res.render('links/profile', {users2,partidas});
});

module.exports = router;