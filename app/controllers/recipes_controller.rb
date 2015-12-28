class RecipesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  	@recipes = if params[:keywords]
  		Recipe.where('name like ?', "%#{params[:keywords]}%")
  	else
  		[]
  	end
  end

  def new
    @all_categories = Category.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      params[:categories].keys.each {|category_id| CategoriesRecipe.create(recipe_id: @recipe.id, category_id: category_id.to_i)} if params[:categories].present?
    end
    
    render 'show', status: 201
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def edit
    recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(recipe_params)
    if !recipe.categories.present?
      params[:categories].keys.each {|category_id| CategoriesRecipe.create(recipe_id: recipe.id, category_id: category_id.to_i)} if params[:categories].present?
    else
      category_recipes = CategoriesRecipe.where(recipe_id: recipe.id)
      binding.pry
      # category_recipes.each { |category_recipe| params[:categories].keys.each {|category| category_recipe.update_attributes(category_id: category.to_id)} }
    end
    head :no_content
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    head :no_content
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions)
  end
end
