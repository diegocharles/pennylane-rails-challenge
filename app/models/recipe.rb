class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true
  validates :instructions, length: { minimum: 20 }

  def self.search_by_ingredient_names(ingredient_names)
    joins(:ingredients)
      .where(ingredients: { name: ingredient_names })
      .distinct
  end
end
