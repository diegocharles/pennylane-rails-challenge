require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  test "should not allow duplicate ingredient for the same recipe" do
    tomato = Ingredient.create(name: "Tomato")
    pasta = Recipe.create(title: "Pasta", instructions: "Cook pasta. Add tomato.")
    RecipeIngredient.create(recipe: pasta, ingredient: tomato)

    duplicate = RecipeIngredient.new(recipe: pasta, ingredient: tomato)
    assert_not duplicate.valid?, "Should not allow duplicate ingredient for the same recipe"
  end

  test "should not save recipe with instructions less than 20 characters" do
    recipe = Recipe.new(title: "Pasta", instructions: "Cook pasta.")
    assert_not recipe.valid?, "Saved the recipe with instructions less than 20 characters"
  end

  test "should save recipe with instructions of 20 characters or more" do
    recipe = Recipe.new(title: "Pasta", instructions: "Cook pasta. Add tomato sauce and cheese.")
    assert recipe.valid?, "Failed to save the recipe with instructions of 20 characters or more"
  end
end
