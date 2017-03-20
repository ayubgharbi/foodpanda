class RestaurantsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart, except: :index


  def index
		@restaurants = Restaurant.all
    if params[:address].present?
      @restaurants = Restaurant.near(params[:address])
    else
      @restaurants = Restaurant.all
    end
	end

	def new
    	@restaurant = Restaurant.new
 	end

	def show    
    @reviews = Review.where(restaurant_id: @restaurant.id).order("created_at DESC")
    @foods = Food.where(restaurant_id: @restaurant.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end


	def edit
	end

	def create
    	@restaurant = Restaurant.new(restaurant_params)

    	respond_to do |format|
      		if @restaurant.save
        		format.html { redirect_to restaurants_path, notice: 'Restaurant was successfully created.' }
        		format.json { render :show, status: :created, location: @restaurant }
     		else
        		format.html { render :new }
        		format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      		end
    	end
  	end


	def update
    	respond_to do |format|
      		if @restaurant.update(restaurant_params)
        		format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        		format.json { render :show, status: :ok, location: @restaurant }
      		else
        		format.html { render :edit }
        		format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      		end
    	end
  	end	
	

	def destroy
    	@restaurant.destroy
    	respond_to do |format|
      		format.html { redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

	private
    	def set_restaurant
      		@restaurant = Restaurant.find(params[:id])
    	end

    	def restaurant_params
     		params.require(:restaurant).permit(:name, :address, :city, :image, :rating)
   		end
end
