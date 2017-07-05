class GroupsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @group = @recipe.groups.create(group_params)
    redirect_to @recipe
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to recipe_path(@group.recipe)
  end

  private

  def group_params
    params.require(:group).permit(:category_id)
  end
end
