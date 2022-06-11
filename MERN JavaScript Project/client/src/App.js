//axios and react-router-dom@5 installed
import { BrowserRouter, Redirect, Route, Switch } from 'react-router-dom';
import './App.css';
import AddEntry from './components/AddEntry';
import ShowEntry from './components/ShowEntry';
import AllEntries from './views/AllEntries';
import EditEntry from './components/EditEntry';


function App() {
  return (

    <BrowserRouter>
      <div className="App">

        <Switch>

          <Route path="/journals/update/:id">
            <EditEntry/>
          </Route>
          <Route path="/journals/new">
            <AddEntry/>
          </Route>

          <Route path="/journals/:id">
            <ShowEntry/>
          </Route>

          <Route path="/journals/">
            <AllEntries/>
          </Route>

          <Route path="/">
            <Redirect to="/journals/"/>
          </Route>


        </Switch>

      </div>
    </BrowserRouter>
  );
}

export default App;

