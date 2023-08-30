# test/models/recipe_test.rb

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'should return recipes containing all specified ingredients' do
    recipe1 = Recipe.create(title: 'Recipe 1', ingredients: ['egg', 'milk'])
    recipe2 = Recipe.create(title: 'Recipe 2', ingredients: ['cinnamon', 'sugar'])
    recipe3 = Recipe.create(title: 'Recipe 3', ingredients: ['egg', 'cinnamon'])

    assert_equal [recipe3], Recipe.search_by_ingredients(['egg', 'cinnamon'])
  end

  test 'should return all recipes when no ingredients are specified' do
    recipe1 = Recipe.create(title: 'Recipe 1', ingredients: ['egg', 'milk'])
    recipe2 = Recipe.create(title: 'Recipe 2', ingredients: ['cinnamon', 'sugar'])
    recipe3 = Recipe.create(title: 'Recipe 3', ingredients: ['egg', 'cinnamon'])

    assert_equal [recipe1, recipe2, recipe3], Recipe.search_by_ingredients([])
  end
end
