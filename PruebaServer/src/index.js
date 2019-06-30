const express = require('express');
const morgan = require('morgan'); //Morgan muestra por consola las peticiones que van llegando
const exphbs = require('express-handlebars'); //Motor de plantillas handlebars
const path = require('path'); //Llama al módulo path

 //Inicialización de todo (base de datos)
const app = express(); //Se ejecuta express y guarda un objeto en app

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
app.use(morgan('dev')); //Dev: string que muestra el mensaje por consola
app.use(express.urlencoded({extended: false})); //Para poder aceptar datos que envían los usuarios (solo datos simples como nombres por ej)
app.use(express.json()); //Sirve para futuras mejoras de la app

//Variables globales
app.use((req, res, next) => { //Toma los datos del usuario, lo que el server quiere responder y pasa a lo siguiente en el código

    next();
});

//Rutas
app.use(require('./routes')); //Busca automáticamente el archivo index.js
app.use(require('./routes/autenticar'));
app.use('/links', require('./routes/links')); 

//Public
app.use(express.static(path.join(__dirname, 'public'))); //Para saber dónde estarán las carpetas públicas

//Iniciar el server
app.listen(app.get('port'), () => {
    console.log('Servidor en el puerto: ', app.get('port')); //Si se conecta al puerto muestra un mensaje
});