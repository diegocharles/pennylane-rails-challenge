class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :ingredient_id, uniqueness: { scope: :recipe_id, message: "This ingredient is already added to the recipe" }
end
