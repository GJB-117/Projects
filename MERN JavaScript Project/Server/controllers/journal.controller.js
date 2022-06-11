const {Journal} = require('../models/journal.model')


module.exports.findAllJournals = (req, res) => {
    Journal.find({})
        .then(journals => res.json(journals))
        .catch(err => res.json(err))
};

module.exports.findJournal = (req, res) => {
    Journal.findOne({ _id: req.params.id })
        .then(journal => res.json(journal))
        .catch(err => res.json({ message: "Something went wrong", error: err }));
};

module.exports.createNewJournal = (req, res) => {
    Journal.create(req.body)
        .then(newlyCreatedJournal => {
            console.log("Server Success")
            res.json({journal: newlyCreatedJournal })
        })
        .catch(err => {
            console.log("DB Error while creating")
            console.log(err)
            res.status(400).json(err)
    });
};

module.exports.updateExistingJournal = (req, res) => {
    Journal.findOneAndUpdate({_id: req.params.id}, req.body, {new: true})
        .then(updatedJournal => {
            res.json({Journal: updatedJournal})
            console.log("Server Success")
        })
        .catch(err => {
            console.log("DB Error while updating")
            res.status(400).json(err)
        })
}

module.exports.deleteAnExistingJournal = (req, res) => {
    Journal.deleteOne({ _id: req.params.id })
        .then(result => res.json({ result: result }))
        .catch(err => res.json(err));
};