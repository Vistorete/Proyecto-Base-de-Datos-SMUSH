const express = require('express');
const router = express.Router();

const passport = require('passport'); //Se importa la biblioteca de passport.js creada

router.get('/signup', (req, res) => { //Con esto al usuario lo redigirá a un formulario
    res.render('auth/signup');
});

router.post('/signup', passport.authenticate('local.signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true //Permite a passport recibir los mensajes "flash"
}));

router.get('/profile', (req, res) => {
    res.send('Este es tu perfil');
});

module.exports = router;
