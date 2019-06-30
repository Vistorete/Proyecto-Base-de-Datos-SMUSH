const app = require('./config/server');

require('./app/routes/news')(app);

//starting the server
