class RestaurantsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show, :new, :info]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :info]
  include CurrentCart
  before_action :set_cart, only: [:show, :info]


  
def index
  @restaurants = Restaurant.all.order("created_at DESC")
  @search = Restaurant.ransack(params[:q])
  @restaurants = @search.result(distinct: true)


  if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
end



  def show    
    @reviews = Review.where(restaurant_id: @restaurant.id).order("created_at DESC")
    @foods = Food.where(restaurant_id: @restaurant.id).order("created_at DESC")
    @categories = Category.where(restaurant_id: @restaurant.id).order("created_at DESC")

        
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

	def new
    	@restaurant = Restaurant.new
 	end
  
  def create
      @restaurant = Restaurant.new(restaurant_params)

      respond_to do |format|
          if @restaurant.save
            format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
            format.json { render :show, status: :created, location: @restaurant }
        else
            format.html { render :new }
            format.json { render json: @restaurant.errors, status: :unprocessable_entity }
          end
      end
  end

	def edit
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

   def info
    @reviews = Review.where(restaurant_id: @restaurant.id).order("created_at DESC")
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
   end 

	private
    	def set_restaurant
      		@restaurant = Restaurant.find(params[:id]) 
    	end

    	def restaurant_params
     		params.require(:restaurant).permit(:name, :address, :city, :image, :rating, :estimated_delivery_time, area_ids:[])
   		end
end
