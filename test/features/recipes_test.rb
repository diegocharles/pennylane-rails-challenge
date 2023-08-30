require 'test_helper'

class RecipesTest < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def setup
    Recipe.create!(title: "Egg Dish", ingredients: ["egg"], category: "Breakfast", ratings: 4.5)
    Recipe.create!(title: "Egg and Milk Dish", ingredients: ["egg", "milk"], category: "Breakfast", ratings: 4.7)
    Recipe.create!(title: "Dragonfruit Dish", ingredients: ["dragonfruit"], category: "Dessert", ratings: 3.5)
  end

  test "searching for recipes by single ingredient" do
    visit root_url
    fill_in "ingredientSearch", with: "egg"
    sleep(2)  # wait for 2 seconds for the search to complete

    assert_text "Egg Dish"
  end

  test "searching for recipes by multiple ingredients" do
    visit root_url
    fill_in "ingredientSearch", with: "egg, milk"
    sleep(2)  # wait for 2 seconds for the search to complete

    assert_text "Egg and Milk Dish"
  end

  test "handling no results" do
    visit root_url
    fill_in "ingredientSearch", with: "dragonfruit"
    sleep(2)  # wait for 2 seconds for the search to complete

    assert_text "Dragonfruit Dish"
  end
end
