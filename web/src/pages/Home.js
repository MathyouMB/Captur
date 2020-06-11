import React, { useState, useEffect } from 'react';
import { useQuery } from '@apollo/react-hooks';
import { GAMES } from '../queries'

const Home = () => {

    const { loading, error, data, fetchMore } = useQuery(GAMES);
    const [games, setGames] = useState([]);
    
    useEffect(() => {
        if(!error && !loading){
            console.log(data)
            //setGames(games.concat());
        }
    }, [data, error, loading])

    return (
        <div className="home">
            
        </div>
    );
}

export default Home;
