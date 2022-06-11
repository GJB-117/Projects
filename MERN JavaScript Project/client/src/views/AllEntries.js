import axios from "axios";
import React, {useEffect, useState} from "react";
import ShowAll from "../components/ShowAll";

const AllEntries = () => {
    const [journal, setJournal] = useState([]);
    const [loaded, setLoaded] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8000/api/journals/')
            .then(res => {
                setJournal(res.data);
                setLoaded(true);
            })
            .catch(err => console.error(err));
    }, []);
    return(
        <div className="header">
            {loaded && <ShowAll journal={journal}/>}
        </div>
    )
}
export default AllEntries;