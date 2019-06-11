require "pry"
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'food')
    @recipe.ingredients.build(name: 'drink')

    # byebug

  end

  def create
    # binding.pry
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end
end

private

def recipe_params
  params.require(:recipe).permit(:title, ingredients_attributes: [:quantity, :name])
end
