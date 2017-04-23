class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy
	belongs_to :restaurant
	belongs_to :user
	def add_food(food)
		current_item = line_items.find_by(food_id: food.id)
		if current_item
			current_item.quantity += 1 
		else 
			current_item = line_items.build(food_id: food.id)
		end
		current_item
	end

	def total_price 
		line_items.to_a.sum { |item| item.total_price }
	end



	def remove_food(food)
	    current_item = line_items.find_by(food_id: food.id)
		if current_item.quantity > 1
			current_item.quantity -= 1
		elsif current_item.quantity = 1
		    current_item.destroy
		end
	   	current_item
	end
end
