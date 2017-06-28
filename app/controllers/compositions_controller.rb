class CompositionsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @composition = @recipe.compositions.new
    ingredient = composition_params[:ingredient].downcase
    if Ingredient.find_by(name: ingredient) == nil
      @composition.ingredient = Ingredient.create(name: ingredient)
    else
      ingredient = Ingredient.find_by(name: ingredient)
      @composition.ingredient = ingredient
    end
    if @composition.save
      redirect_to @recipe
    else
      render 'recipes/show'
    end
  end

  def destroy
    @composition = Composition.find(params[:id])
    @composition.destroy
    redirect_to recipe_path(@composition.recipe)
  end

  private

  def composition_params
    params.require(:composition).permit(:ingredient)
  end
end
