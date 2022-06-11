import React from "react";
import { Link } from "react-router-dom";

const ShowAll = (props) => {

    return (
        <div className="container">
            <div className="header">
                <h2>Welcome To Your Journal</h2>
            </div>
            <div className="welcome">
                <h3>Quick Message</h3>
                <p>Your Journal is a MERN Stack JavaScript Application to display the knowledge I have learned at Coding Dojo Coding Boot-Camp.
                    This application was designed to allow people to share journal entries anonymously, and keep track of thier daily goals, and
                    achievements. Your Journal is a WIP as I plan to add more. Your Journal represnts my current knowledge, and will become more
                    intricate as my understanding of JavaScript, and the MERN stack improves. If you would like to see my other projects, like
                    EazyPC built with Java and Spring Boot, please look through my github GJB-117. Thank you.
                </p>
            </div>
            <div className="journal-page">
                <h3>All Entries</h3>
                <Link to="/journals/new">Add a new Entry</Link>
                <table className="styled-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Author</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {props.journal.map((journal, i) =>
                            <tr className="active-row" key={i}>
                                <td>{journal.name}</td>
                                <td>{journal.Author}</td>
                                <td><Link to={`/journals/${journal._id}`}>Details</Link> <Link to={`/journals/update/${journal._id}`}>Edit</Link></td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>

        </div>
    )
}
export default ShowAll;