class CategoriesRecipe < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :category
end
