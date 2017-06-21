class RecipesController < ApplicationController

  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = "Recette sauvegardée"
      redirect_to @recipe
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo)
  end
end
