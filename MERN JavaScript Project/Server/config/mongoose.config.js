const mongoose = require('mongoose');


mongoose.set('runValidators', true);
mongoose.connect("mongodb://localhost/my_db", {
    useNewUrlParser: true,
    useUnifiedTopology: true
})
    .then(() => console.log("Connection to the my_db was successful"))
    .catch(() => console.log("Database connection was unsuccessful", err));