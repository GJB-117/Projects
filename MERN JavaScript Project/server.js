//express, mongoose and cors installed

const express = require('express');
const app = express();
const cors = require('cors');
require('./Server/config/mongoose.config');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));
require('./Server/routes/journal.routes')(app);
app.listen(8000, () => {console.log("Listening on port 8000")})