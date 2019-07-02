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
    const { nombre, tag } = req.body;
    const newTeam = {
        nombre,
        tag
    };
    console.log(newTeam);
    await con.query('INSERT INTO equipos set ?', [newTeam]);
    res.redirect('/teams');
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

var userEdit;

router.get('/edit/:id', async (req, res) => { //Función para obtener el equipo a editar
    const { id } = req.params;
    await con.query('SELECT * FROM equipos WHERE equipos.id = ?', [id], function(err, result, fields){
        if(err) throw err;
        userEdit = result;
    });
    //console.log(userEdit);
    res.render('links/team_edit', {userEdit});
});

router.post('/edit/:id', async (req, res) => { //Función para editar el equipo obtenido
    const id = req.params.id;
    const { nombre, tag } = req.body;
    const newUser = {
        nombre,
        tag
    };
    await con.query('UPDATE equipos set ? WHERE id = ?', [newUser, id]);
    //res.send('hola');
    res.redirect('/teams');
});

var users;

router.get('/members/:id', async (req, res) => { //Función para obtener el usuario a editar
    const { id } = req.params;
    await con.query('SELECT * FROM users WHERE id_equipo = ?', [id], function(err, result, fields){
        if(err) throw err;
        users = result;
    });
    //console.log(users2);
    res.render('links/members', {users});
});

module.exports = router;