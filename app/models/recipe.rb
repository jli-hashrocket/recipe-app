class Recipe < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :instructions

	has_and_belongs_to_many :categories
end
