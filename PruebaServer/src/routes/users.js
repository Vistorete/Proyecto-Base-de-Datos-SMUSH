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

router.get('/profile/:id', async(req, res) => {
    const { id } = req.params;
    await con.query('SELECT * FROM users WHERE id = ?', [id], function(err,result,fields){
        if(err) throw err
        users2 = result;
    });
    //console.log(users2);
    res.render('links/profile', {users2});
});

module.exports = router;