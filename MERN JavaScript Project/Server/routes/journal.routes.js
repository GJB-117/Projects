const JournalController = require('../controllers/journal.controller')

module.exports = (app) => {
    app.get("/api/journals/", JournalController.findAllJournals);
    app.get("/api/journals/:id", JournalController.findJournal);
    app.post("/api/journals/new", JournalController.createNewJournal);
    app.delete("/api/journals/delete/:id", JournalController.deleteAnExistingJournal);
    app.put("/api/journals/update/:id", JournalController.updateExistingJournal);
}