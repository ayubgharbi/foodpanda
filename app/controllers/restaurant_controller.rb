class RestaurantController < ApplicationController
  skip_before_action :authorize
  
  include CurrentCart
  before_action :set_cart
  def index
  	@foods = Food.order(:title)
  end
end
