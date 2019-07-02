const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'database_smush'
});

var equipos;

con.connect(function(err){
    if(err) throw err;
});

router.get('/', async (req, res) => {
    con.query('SELECT * FROM equipos', function(err,result,fields){
        if(err) throw err;
        equipos = result;
    });

    res.render('links/teams', {equipos}); //Renderiza el teams.hbs
});

router.post('/', async (req, res) => {
    const { id, nombre, tag } = req.body;
    const newTeam = {
        id,
        nombre,
        tag
    };
    var query = await con.query('INSERT INTO equipos set ?', [newTeam]);
    res.render('/teams', {equipos});
});

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    await con.query('SELECT FROM equipos WHERE id = ?', [id]);
    res.send(req.params.id);
});

router.get('/delete/:id', async (req, res) => { //Función para borrar team
    const id = req.params.id;
    await con.query('DELETE FROM equipos WHERE id = ?', [id]);
    res.redirect('/teams'); //Redirecciona a teams.hbs
});

router.get('/edit/:id', async (req, res) => { //Función para obtener el equipo a editar
    const { id } = req.params;
    const links = await con.query('SELECT * FROM equipos WHERE id = ?', [id]);
    //console.log(links[0]);
    res.render('links/team_edit', {links: links[0]});
});

router.get('/edit/:id', async (req, res) => { //Función para editar el equipo obtenido
    const id = req.params.id;
    const { nombre, tag } = req.body;
    const newUser = {
        nombre,
        tag
    };
    await pool.query('UPDATE equipos set ? WHERE id = ?', [newUser, id]);
    //res.send('hola');
    res.redirect('/teams');
});

var users2;

router.get('/members/:id', async (req, res) => { //Función para obtener el usuario a editar
    const { id } = req.params;
    await con.query('SELECT * FROM users WHERE id_equipo = ?', [id], function(err, result, fields){
        if(err) throw err;
        users2 = result;
    });
    //console.log(users2);
    res.render('links/members', {users2});
});

module.exports = router;