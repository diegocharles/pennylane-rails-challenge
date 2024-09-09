# app/controllers/api/v1/recipes_controller.rb

module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:search]
           ingredients = params[:search].split(',').map(&:strip)
           @recipes = Recipe.search_with_ingredients(ingredients)
        else
          @recipes = Recipe.all
        end

        render json: @recipes
      end

      def show
        @recipe = Recipe.find(params[:id])
        render json: @recipe
      end
    end
  end
end
