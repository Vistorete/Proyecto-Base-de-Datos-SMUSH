const {format} = require('timeago.js'); //Se requiere la librería timeago

const helpers = {};

helpers.timeago = (timestamp) => {
    return format(timestamp); //Convierte el timestamp en un formato de hace 2 minutos atrás
};

module.exports = helpers;