class CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @categories = if params[:cat_keywords]
      Category.where('name like ?', "%#{params[:cat_keywords]}%")
    else
      []
    end
    @all_categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    render 'show', status: 201
  end

  def show
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
