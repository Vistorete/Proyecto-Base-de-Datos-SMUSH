const express = require('express');
const router = express.Router();

var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'database_smush'
});

var usuario;

connection.connect(function(err){
    if(err) throw err;
});

router.get('/', async (req, res) => {
    connection.query('SELECT * FROM users;', function(err,result,fields){
        if(err) throw err;
        console.log(result);
        usuario=result;
    });
    //res.send(usuario);
    res.render('links/users', {usuario});
    console.log(usuario);
    //res.send('listo');
});

/*router.post('/',async(req,res)=>{
    const {id, id_equipo, username, fullname, edad, pais} = req.body;
    const newUser = {
        id,
        id_equipo,
        username,
        fullname,
        edad,
        pais
    };
    var query = await con.query("INSERT INTO users set ?",[newUser]);
    res.render('/users',{usuario});
});*/

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    await connection.query('SELECT FROM users where id = ?', [id]);
    res.send(res.params.id);
    //res.redirect('/users');
});

module.exports = router;