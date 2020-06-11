import React from 'react';
import Navbar from './components/Navbar';
import Home from './pages/Home'
import { BrowserRouter as Router, Route} from "react-router-dom";
import { ApolloProvider } from '@apollo/react-hooks';
import { InMemoryCache } from 'apollo-cache-inmemory';
import { createUploadLink } from 'apollo-upload-client';
import { ApolloClient } from 'apollo-client';

const App = () => {

  const link = createUploadLink({ uri: "http://localhost:4000/graphql" });

  const client = new ApolloClient({
      link,
      cache: new InMemoryCache(),
  });

  return (
    <ApolloProvider client={client}>
    <div className="App">
      <Router>
        <Navbar/>
        <Route path="/" component={() => <Home/>} />
      </Router>
    </div>
    </ApolloProvider>
  );
}

export default App;
