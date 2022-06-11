import React, { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import { useHistory } from "react-router-dom";

const AddEntry = (props) => {
    const history = useHistory();
    const [name, setName] = useState("");
    const [message, setMessage] = useState("");
    const [Author, setAuthor] = useState("");
    const [errors, setErrors] = useState([]);


    const submitHandler = e => {
        e.preventDefault();
        axios.post('http://localhost:8000/api/journals/new', {
            name,
            message,
            Author,
        })
            .then(res => {
                console.log(res)
                console.log("Success Client Side")
                history.push(`/journals/`)
            })
            .catch(err => {
                const errorArr = [];
                if (err.response.data.code === 11000) {
                    console.log("Hello Error")
                    errorArr.push("This name is already in use")

                } else {
                    console.log(err.response)
                    const errorResponse = err.response.data.errors;

                    for (const key of Object.keys(errorResponse)) {

                        errorArr.push(errorResponse[key].message)
                    }
                }
                console.log(errorArr)
                setErrors(errorArr);
            })
    }

    return (
        <div className="container">
            <div className="header">
                <h1>Add a Journal Entry</h1> <Link to="/">Go Home</Link>
            </div>
            <div className="form-page">
                <form onSubmit={submitHandler}>
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

                    <input class="button-68" role="button" type="submit" value="Add Entry" />
                </form>
            </div>
        </div>
    )

}
export default AddEntry;