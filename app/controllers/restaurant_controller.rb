class RestaurantController < ApplicationController
  def index
  	@foods = Food.order(:title)
  end
end
