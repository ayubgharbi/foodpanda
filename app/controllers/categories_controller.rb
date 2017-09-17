class CategoriesController < InheritedResources::Base
  	before_action :set_category, only: [:show, :edit, :update, :destroy]
  	before_action :set_restaurant

  	

  	def show 
  	end

  	def new
  		@category = Category.new
  	end

  	def edit 

  	end

  	def create
	    @category = Category.new(category_params)
	    @category.restaurant_id = @restaurant.id

	    respond_to do |format|
	      if @category.save
	        format.html { redirect_to @restaurant }
	        format.json { render :show, status: :created, location: @Category }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def update
	    respond_to do |format|
	      if @category.update(category_params)
	        format.html { redirect_to @restaurant }
	        format.json { render :show, status: :ok, location: @category }
	      else
	        format.html { render :edit }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
	    @category.destroy
	    respond_to do |format|
	      	format.html { redirect_to @restaurant, notice: 'Category was successfully destroyed.' }
	      	format.json { head :no_content }
	    end
  	end 
  	
  	private
		  def set_category
      		@category = Category.find(params[:id])
    	end
    	
    	def set_restaurant
      		@restaurant = Restaurant.find(params[:restaurant_id])
    	end
    	
    	def category_params
      		params.require(:category).permit(:name)
    	end
end

