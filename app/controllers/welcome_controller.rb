class WelcomeController < ApplicationController
	skip_before_action :authorize
  
  def index
  	@restaurantss = Restaurant.take(4)
  	@areas = Area.all

  	@search = Restaurant.ransack(params[:q])
  	@restaurants = @search.result(distinct: true)

  end
end
