import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';  // Import useParams for React Router v6

const RecipeDetail = () => {
  const [recipe, setRecipe] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const { id } = useParams();  // Use useParams for React Router v6

  useEffect(() => {
    fetch(`/api/v1/recipes/${id}`)
      .then(response => response.json())
      .then(data => {
        setRecipe(data);
        setLoading(false);
      })
      .catch(error => {
        console.log(error);
        setError('An error occurred while fetching data.');
        setLoading(false);
      });
  }, [id]);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>{error}</div>;

  return (
    <div className="container">
      {recipe && (
        <>
          <h1>{recipe.title}</h1>
          <img src={recipe.image} alt={recipe.title} />
          <p><strong>Category:</strong> {recipe.category}</p>
          <p><strong>Ratings:</strong> {recipe.ratings}</p>
          <p><strong>Cook Time:</strong> {recipe.cook_time} minutes</p>
          <p><strong>Prep Time:</strong> {recipe.prep_time} minutes</p>
          <p><strong>Ingredients:</strong> {Array.isArray(recipe.ingredients) ? recipe.ingredients.join(', ') : ''}</p>
          <p><strong>Instructions:</strong> {recipe.instructions}</p>
        </>
      )}
    </div>
  );
};

export default RecipeDetail;
