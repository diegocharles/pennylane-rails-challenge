// app/javascript/components/RecipeList.js

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

const RecipeList = ({ searchQuery }) => {
  const [recipes, setRecipes] = useState([]);

  useEffect(() => {
    // Add the search query as a query parameter
    fetch(`/api/v1/recipes?search=${searchQuery}`)
      .then(response => response.json())
      .then(data => setRecipes(data))
      .catch(error => console.log(error));
  }, [searchQuery]);  // Re-run the effect whenever searchQuery changes

  return (
    <div className="container mt-5">
      { recipes.length > 0 ? (
      <div className="row">
        {recipes.map((recipe) => (
          <div className="col-md-4 mb-4" key={recipe.id}>
            <Link to={`/recipes/${recipe.id}`}>
              <div className="card">
                {recipe.image && <img src={recipe.image} className="card-img-top" alt={`${recipe.title} image`} />}
                <div className="card-body">
                  <h5 className="card-title">{recipe.title}</h5>
                  <p className="card-text">
                    <strong>Category:</strong> {recipe.category}<br />
                    <strong>Ratings:</strong> {recipe.ratings}
                  </p>
                </div>
              </div>
            </Link>
          </div>
        ))}
      </div>
      ) : (
        <div className="text-center">
          <h4>No recipes found for the given ingredients.</h4>
        </div>
      )}
    </div>
  );
};

export default RecipeList;
