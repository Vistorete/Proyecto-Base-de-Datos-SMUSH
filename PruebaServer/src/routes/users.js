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

con.connect(function(err){
    if(err) throw err;
});

router.get('/', async (req, res) => {
        await con.query('SELECT users.id, equipos.tag, users.username, users.fullname, users.edad, users.pais FROM users, equipos WHERE equipos.id = users.id_equipo', function(err,result,fields){
        if(err) throw err;
        //console.log(result);
        users=result;
    });

    res.render('links/users', {users});
    console.log(users);
    //res.send('listo');
});

router.post('/',async(req,res)=>{
    const {id, tag, username, fullname, edad, pais} = req.body;
    const newUser = {
        id,
        tag,
        username,
        fullname,
        edad,
        pais
    };
    var query = await con.query("INSERT INTO users set ?",[newUser]);
    res.render('/users',{users});
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

router.get('/edit/:id', async (req, res) => { //Función para obtener el usuario a editar
    const { id } = req.params;
    const links = await con.query('SELECT users.username, users.fullname, users.edad, users.pais FROM users WHERE id = ?', [id]);
    //console.log(links[0]);
    res.render('links/user_edit', {links: links[0]});
});

router.get('/edit/:id', async (req, res) => { //Función para editar el usuario obtenido
    const id = req.params.id;
    const { username, fullname, edad, pais} = req.body;
    const newUser = {
        username,
        fullname,
        edad,
        pais
    };
    await pool.query('UPDATE users set ? WHERE id = ?', [newUser, id]);
    //res.send('hola');
    res.redirect('/users');
});

module.exports = router;