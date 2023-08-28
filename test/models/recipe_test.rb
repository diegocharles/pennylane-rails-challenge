require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "should not save recipe without title" do
    recipe = Recipe.new
    assert_not recipe.save, "Saved the recipe without a title"
  end

  test "should search recipes by ingredient names" do
    tomato = Ingredient.create(name: "Tomato")
    pasta = Recipe.create(title: "Pasta", instructions: "Cook pasta. Add tomato.")
    pasta.ingredients << tomato

    results = Recipe.search_by_ingredient_names(["Tomato"])
    assert_includes results, pasta, "Pasta recipe should be in the search results"
  end
end
