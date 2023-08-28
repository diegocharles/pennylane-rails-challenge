require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  test "should not save ingredient without name" do
    ingredient = Ingredient.new
    assert_not ingredient.save, "Saved the ingredient without a name"
  end

  test "ingredient names should be unique" do
    ingredient1 = Ingredient.create(name: "Tomato")
    ingredient2 = Ingredient.new(name: "Tomato")
    assert_not ingredient2.valid?, "Ingredient name should be unique"
  end
end
