class CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @recipes = if params[:keywords]
      Category.where('name like ?', "%#{params[:keywords]}%")
    else
      []
    end
  end

  def create
    @category = Category.new(category_params)
    @category.save
    render 'show', status: 201
  end

  def show
    binding.pry
    @category = Category.find(params[:id])
  end

  def edit
    category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update_attributes(category_params)
    head :no_content
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    head :no_content
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
