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

router.get('/signin', (req, res) => {
    res.render('auth/signin'); //Renderiza desde auth el archivo "signin"
});

router.post('/signin', (req, res, next) => {

    passport.authenticate('/local.signin', {
        successRedirect: '/profile', //Si todo sale bien se conecta a profile
        failureRedirect: 'signin',
        failureFlash: true //Para mandar mensajes flash
    })(req, req, next);
});

router.get('/profile', (req, res) => {
    res.send('Este es tu perfil');
});

module.exports = router;
