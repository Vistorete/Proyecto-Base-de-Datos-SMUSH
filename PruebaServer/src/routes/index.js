const express = require('express'); //Se usa para crear las rutas
const router = express.Router(); //Se usa el método de la ruta llamado "Router" que lo convierte en un objeto

router.get('/', (req, res) => { //Se define una ruta y muestra "Hello World"
    res.send('welcome to this cool page'); 
});

module.exports = router; //Exporta el objeto router