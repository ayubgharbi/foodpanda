class Category < ApplicationRecord
	has_many :foods
	belongs_to :restaurant
end
