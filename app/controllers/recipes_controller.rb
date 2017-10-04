class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
      @recipes = current_user.recipes.all.order(id: :desc)
  end

  def search_results
     @recipes = current_user.recipes.joins(:ingredients).where(ingredients:
      { name:  search_params[:ingredient].downcase }
    ).order(id: :desc)
  end

  def show
    @composition = Composition.new
    @group = Group.new
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

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "La recette a été eliminée"
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def search_params
    params.require(:index).permit(:ingredient)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo)
  end
end
