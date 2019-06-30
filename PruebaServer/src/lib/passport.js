//Acá se definen los métodos de autenticación

const passport = require('passport'); //Módulo para crear los métodos
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database'); //Se importa la conexión de la base de datos
const helpers = require('../lib/helpers'); //Se importa el método helpers

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
    newUser.password = await helpers.encryptPassword(password); //Sirve para cifrar una contraseña
    const result = await pool.query('INSERT INTO users SET ?', [newUser]);
    newUser.id = result.insertId;
    return done(null, newUser); //Se le pasa un null para el error y un newUser para guardar el usuario
})); 

passport.serializeUser((user, done) => { //Cuando se ejecute se va a empezar a guardar al usuario que estamos autenticando
    done(null, user.id);
});    

passport.deserializeUser(async (id, done) => { //Se entrega el id y luego se continúa con el resto de código
    const filas = await pool.query('SELECT * FROM users Where id = ?', [id]);
    done(null, filas[0]); //Se da un null para el error y filas con el objeto 0
});
