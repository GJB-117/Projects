import React, { useEffect, useState } from "react";
import axios from "axios";
import { useParams, useHistory, Link } from "react-router-dom";


const EditEntry = () => {
    const history = useHistory();
    const { id } = useParams();
    const [name, setName] = useState("");
    const [message, setMessage] = useState("");
    const [Author, setAuthor] = useState("");
    const [errors, setErrors] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8000/api/journals/' + id)
            .then(res => {
                setName(res.data.name);
                setMessage(res.data.message);
                setAuthor(res.data.Author);
            })
    }, [id])

    const updateExistingJournal = e => {
        e.preventDefault();
        axios.put('http://localhost:8000/api/journals/update/' + id, {
            name,
            message,
            Author
        })
            .then(res => {
                console.log(res)
                console.log("Success Client Side")
                history.push(`/journals/`)
            })
            .catch(err => {
                const errorResponse = err.response.data.errors;
                const errorArr = [];
                for (const key of Object.keys(errorResponse)) {
                    errorArr.push(errorResponse[key].message)
                }
                setErrors(errorArr);
            })

    }

    return (
        <div className="container">
            <div className="header">
                <h1>Edit Entry</h1> <Link to="/">Back to Home</Link>
            </div>
            <div className="form-page">
                <form onSubmit={updateExistingJournal}>
                    {errors.map((err, index) => <p key={index}>{err}</p>)}
                    <div className="form-group">
                        <label>Entry Name:</label>
                        <input type="text" onChange={(e) => setName(e.target.value)} value={name} />
                    </div>
                    <div className="form-group">
                        <label>Entry:</label>
                        <textarea className="text-box" type="text" onChange={(e) => setMessage(e.target.value)} value={message} />
                    </div>
                    <div className="form-group">
                        <label>Author Name:</label>
                        <input type="text" onChange={(e) => setAuthor(e.target.value)} value={Author} />
                    </div>
                    <input className="button-68" role="button" type="submit" value="Edit Entry" />
                </form>
            </div>
        </div>

    )

}
export default EditEntry;