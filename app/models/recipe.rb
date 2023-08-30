class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def self.search_by_ingredients(ingredients = nil)
    if ingredients.present?
      query = ingredients.map { |ingredient| "array_to_string(ingredients, ' ') ILIKE ?" }.join(' AND ')
      where(query, *ingredients.map { |ingredient| "%#{ingredient}%" })
    else
      all
    end
  end
end
