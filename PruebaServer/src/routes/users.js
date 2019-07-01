const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'database_smush'
});

var users;

connection.connect(function(err){
    if(err) throw err;
});

router.get('/', async (req, res) => {
    connection.query('SELECT users.id, equipos.tag, users.username, users.fullname, users.edad, users.pais FROM users, equipos WHERE equipos.id = users.id_equipo', function(err,result,fields){
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
    await connection.query('SELECT FROM users where id = ?', [id]);
    res.send(res.params.id);
    //res.redirect('/users');
});

router.get('/delete/:id', async (req, res) => {
    const id = req.params.id;
    await connection.query('DELETE FROM users where id = ?', [id]);
    res.redirect('/users');
});

router.get('/edit/:id', async (req, res) => {
    const id = req.params.id;
    await connection.query('SELECT users.username, users.fullname, users.edad, users.pais FROM users WHERE id = ?', [id]);
    res.render('links/users');
});



module.exports = router;