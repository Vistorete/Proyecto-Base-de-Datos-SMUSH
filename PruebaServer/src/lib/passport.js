//Acá se definen los métodos de autenticación

const passport = require('passport'); //Módulo para crear los métodos
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database'); //Se importa la conexión de la base de datos

passport.use('local.signup', new LocalStrategy({ //Se define la autenticación
    usernameField: 'username', //Se recibe este campo a través de "username" que está en signup.hbs
    passwordField: 'password', //Se recibe este campo a través de "password" que está en signup.hbs
    passReqToCallback: true
}, async(req, username, password, done) => {
    const { fullname } = req.body; //Se importa el fullname desde req.body
    const newUser = { //Se define un objeto usuario con sus atributos
        username,
        password,
        fullname
    };
    await pool.query('INSERT INTO users SET ?', [newUser]);
})); 

/*passport.serializeUser((usr, done) => { //Cuando se ejecute se va a empezar a guardar al usuario que estamos autenticando

});*/    
