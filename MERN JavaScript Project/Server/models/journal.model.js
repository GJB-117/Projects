const mongoose = require('mongoose');
const JournalSchema = new mongoose.Schema({
    name: {type: String,
        unique: [ true,
            "Title is already taken"],
            
        minlength: [
            3,
            "Title must be at least 3 Characters"
        ],
        required: [
            true,
            "Title is required"
        ]
    },
    message: {type: String,
        minlength: [
            3,
            "Entry must be at least 3 Characters"
        ],
        required: [
            true,
            "Entry is required"
        ]
    },
    Author: {type: String}
}, {timestamps: true});

module.exports.Journal = mongoose.model('Journal', JournalSchema);

