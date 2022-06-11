import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams, Link, useHistory } from 'react-router-dom';

const ShowEntry = () => {
    const history = useHistory();
    const [journal, setJournal] = useState({})
    const { id } = useParams();


    const removeJournal = (id) => {
        axios.delete('http://localhost:8000/api/journals/delete/' + id)
            .then(res => {
                console.log(journal)
                history.push(`/journals/`)
            })
            .catch(err => console.error(err));
    }

    useEffect(() => {
        axios.get('http://localhost:8000/api/journals/' + id)
            .then(res => {
                setJournal(res.data)
                console.log(res.data)
            })
            .catch(err => console.error(err));
    }, [id])

    return (
        <div className='container'>
            <div className='header'>
                <h1>Your Entry</h1> <Link to="/">Back to Home</Link>
            </div>
            <div className='detail-page'>
                <div className='detail-block'>
                    <label>Entry Name:</label>
                    <p>{journal.name}</p>
                </div>
                <div className='detail-block'>
                    <label>Entry:</label>
                    <p>{journal.message}</p>
                </div>
                <div className='detail-block'>
                    <label>Author Name:</label>
                    <p>{journal.Author}</p>
                </div>
                <button className='button-68' role="button" onClick={(e) => { removeJournal(journal._id) }}>Delete</button>
            </div>
        </div>
    )
}
export default ShowEntry;