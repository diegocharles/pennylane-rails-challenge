require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'should return recipes containing any of the specified ingredients' do
    recipe1 = Recipe.create(title: 'Recipe 1', ingredients: ['egg', 'milk'])
    recipe2 = Recipe.create(title: 'Recipe 2', ingredients: ['cinnamon', 'sugar'])
    recipe3 = Recipe.create(title: 'Recipe 3', ingredients: ['grape', 'chocolate'])
    recipe4 = Recipe.create(title: 'Recipe 4', ingredients: ['butter', 'flour'])
    recipe5 = Recipe.create(title: 'Recipe 5', ingredients: ['egg', 'cinnamon'])

    assert_equal [recipe1, recipe2, recipe5], Recipe.search_with_ingredients(['egg', 'cinnamon']).to_a
  end

  test 'should return all recipes when no ingredients are specified' do
    recipe1 = Recipe.create(title: 'Recipe 1', ingredients: ['egg', 'milk'])
    recipe2 = Recipe.create(title: 'Recipe 2', ingredients: ['cinnamon', 'sugar'])
    recipe3 = Recipe.create(title: 'Recipe 3', ingredients: ['egg', 'cinnamon'])
    recipe4 = Recipe.create(title: 'Recipe 4', ingredients: ['butter', 'flour'])

    # Should return all recipes when no ingredients are specified
    assert_equal [recipe1, recipe2, recipe3, recipe4], Recipe.search_with_ingredients([]).to_a
  end
end
