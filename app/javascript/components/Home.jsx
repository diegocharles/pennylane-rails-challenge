// app/javascript/components/Home.js

import React, { useState } from 'react';
import RecipesList from './RecipesList';
import Search from './Search';

const Home = () => {
  const [searchQuery, setSearchQuery] = useState('');

  return (
    <div className="container">
      <h1>Welcome to my fantastic Recipe App</h1>

      <Search searchQuery={searchQuery} setSearchQuery={setSearchQuery} />

      <div className="mt-5">
        <h2>Featured Recipes</h2>
        <RecipesList searchQuery={searchQuery} />
      </div>
    </div>
  );
};

export default Home;
