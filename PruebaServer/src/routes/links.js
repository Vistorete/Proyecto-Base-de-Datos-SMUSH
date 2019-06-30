const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/add', (req, res) => { //Se encarga de hacer una petición 'get'
    res.render('links/add');  //Al escribir 'add' en el link redirecciona al archivo 'add' en la carpeta 'links'
});

router.post('/add', async(req, res) => { //Se pide 'add' por el método post de html (distinto al get de arriba)
    const { title, url, description } = req.body;
    const newLink = {
        title,
        url,
        description
    };
    const hola = await pool.query('INSERT INTO links set ?', [newLink]);
    res.redirect('/links');
});

router.get('/', async (req, res) => {
    const links = await pool.query('SELECT * FROM links'); //Se hace la petición de sql para obtener los links
    res.render('links/list', { links }); //Se abre el archivo list.hbs en links y se le pasa lo que hay en links
});

router.get('/delete/:id', async (req, res) => { //Sirve para borrar los usuarios
    const { id } = req.params; //Busca la constante id
    await pool.query('DELETE FROM links WHERE ID = ?', [id]);
    res.redirect('/links');
});

router.get('/edit/:id', async (req, res) => { //Sirve para mover el link a los datos a editar
    const { id } = req.params; //Busca la id
    const links = await pool.query('SELECT * FROM links WHERE id = ?', [id]); //Devuelve los datos del id
    console.log(links[0]);
    res.render('links/edit', {link: links[0]}); //Renderiza lo que hay en el archivo links/edit
});

router.post('/edit/:id', async (req, res) => { // Sirve para editar los datos de la función de arriba
    const { id } = req.params; //Busca la id
    const { title, description, url } = req.body; //Elementos ingresados
    const newLink = { //Guarda los datos en la variable newLink en ese orden
        title,
        description,
        url
    };
    console.log(newLink);
    await pool.query('UPDATE links set ? WHERE id = ?', [newLink, id]); //Ingresa esto en SQL para editar los datos
    res.redirect('/links');
});

module.exports = router;
