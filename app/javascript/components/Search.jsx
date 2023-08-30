// app/javascript/components/SearchComponent.js

import React from 'react';

const Search = ({ searchQuery, setSearchQuery }) => {
  const handleSearchChange = (e) => {
    setSearchQuery(e.target.value);
  };

  return (
    <div className="mt-5">
      <h2>Search Ingredients</h2>
      <input
          type="text"
          id="ingredientSearch"
          placeholder="e.g., egg, milk, cinnamon"
          value={searchQuery}
          className = "form-control mt-2"
          onChange={(e) => setSearchQuery(e.target.value)}
        />
        <small>Enter ingredients separated by commas.</small>

    </div>
  );
};

export default Search;
