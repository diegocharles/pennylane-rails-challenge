class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def self.search_with_ingredients(ingredients = [])
    if ingredients.present?
      ingredients_query = ingredients.map { |ingredient| "EXISTS (SELECT 1 FROM unnest(ingredients) as i WHERE i ILIKE ?)" }.join(' OR ')
      where(ingredients_query, *ingredients.map { |ingredient| "%#{ingredient}%" })
    else
      all
    end
  end
end
