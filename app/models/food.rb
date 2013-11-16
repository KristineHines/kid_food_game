class Food < ActiveRecord::Base
	belongs_to :food_group
	belongs_to :category
end
