class IngredientsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = ingredient_params[:name].downcase
    if Ingredient.find_by(name: @ingredient) == nil
      @recipe.ingredients.create(name: @ingredient)
    else
      @ingredient = Ingredient.find_by(name: @ingredient)
      @ingredient.recipes = (@recipe)
      @ingredient.save
    end
    redirect_to @recipe
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
