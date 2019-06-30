//Biblioteca que se encarga de cifrar los datos

const bcrypt = require('bcryptjs'); //Módulo para cifrar los datos

const helpers = {};

helpers.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10); //Se usa genSalt para poder generar un hash. Se ejecuta 10 veces 
    const hash = await bcrypt.hash(password, salt); //Con esto se empieza a cifrar la contraseña
    return hash;
};

helpers.matchPassword = async(password, savedPassword) => {
    await bcrypt.compare(password, savedPassword); //Compara la password ingresada con la que está registrada
};

module.exports = helpers; //Se importa helpers