const express = require('express');
const morgan = require('morgan'); //Morgan muestra por consola las peticiones que van llegando
const exphbs = require('express-handlebars'); //Motor de plantillas handlebars
const path = require('path'); //Llama al módulo path
const flash = require('connect-flash'); //Middleware que servirá para mostrar mensajes de las acciones en la página
const session = require('express-session'); //Se necesita para verificar la sesión
const MySQLStore = require('express-mysql-session'); //Biblioteca necesaria para guardar la sesión en donde se desee
const passport = require('passport'); //Se importa para poder ejecutar su código principal

const { database } = require('./keys'); //Se usa la database desde './keys'

 //Inicialización de todo (base de datos)
const app = express(); //Se ejecuta express y guarda un objeto en app
require('./lib/passport');

//Settings (setting como el puerto del server)
app.set('port', process.env.PORT || 4000); //Define un puerto, si hay uno disponible en el sistema lo usa, si no usa el 4000
app.set('views', path.join(__dirname, 'views')); //dirname devuelve la ruta de src y "join" concatena con "views"
app.engine('.hbs', exphbs({
    defaultLayout: 'main', //Nombre de la plantilla principal
    layoutsDir: path.join(app.get('views'), 'layouts'), //Dice que layouts está justo dentro de la carpeta "views"
    partialsDir: path.join(app.get('views'), 'partials'), //Dice que partials está justo dentro de "views"
    extname: '.hbs', //Da el nombre que tendrán los archivos de handlebars, ya que la extensión es ".handlebars"
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs'); //Con esto se puede usar la configuración del server

//Middlewares (funciones que se ejecutan cada vez que se envía una petición al servidor)
app.use(session({ //Se configura la sesión antes de usar flash
    secret: 'CreandoSesion',
    resave: false, //Para que no se empiece a renovar la sesión
    saveUninitialized: false, //Falso para que no se vuelva a establecer la sesión
    store: new MySQLStore(database) //Sirve para guardar las sesiones en la base de datos
})); 
app.use(flash());
app.use(morgan('dev')); //Dev: string que muestra el mensaje por consola
app.use(express.urlencoded({extended: false})); //Para poder aceptar datos que envían los usuarios (solo datos simples como nombres por ej)
app.use(express.json()); //Sirve para futuras mejoras de la app
app.use(passport.initialize()); //Se inicializa passport
app.use(passport.session()); //Se define para que passport pueda manejar los datos

//Variables globales
app.use((req, res, next) => { //Toma los datos del usuario, lo que el server quiere responder y pasa a lo siguiente en el código
    app.locals.success = req.flash('success'); //El mensaje estará disponible para todas las "views"
    next();
});

//Rutas
app.use(require('./routes')); //Busca automáticamente el archivo index.js
app.use(require('./routes/autenticar'));
app.use('/links', require('./routes/links'));

app.use('/leader_board',require('./routes/leader_board'));

//Public
app.use(express.static(path.join(__dirname, 'public'))); //Para saber dónde estarán las carpetas públicas

//Iniciar el server
app.listen(app.get('port'), () => {
    console.log('Servidor en el puerto: ', app.get('port')); //Si se conecta al puerto muestra un mensaje
});