class AreasController < ApplicationController
	before_action :set_area, only: [:show, :edit, :update, :destroy]
	
	def index
  		@areas = Area.all
  	end

  	def show 
  	end

  	def new
  		@area = Area.new
  	end

  	def edit 
  	end

  	def create
	    @area = Area.new(area_params)

	    respond_to do |format|
	      if @area.save
	        format.html { redirect_to root_url }
	        format.json { render :show, status: :created, location: @area }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def update
	    respond_to do |format|
	      if @area.update(category_params)
	        format.html { redirect_to root_url }
	        format.json { render :show, status: :ok, location: @category }
	      else
	        format.html { render :edit }
	        format.json { render json: @area.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
	    @area.destroy
	    respond_to do |format|
	      	format.html { redirect_to root_url, notice: 'Area was successfully destroyed.' }
	      	format.json { head :no_content }
	    end
  	end 
  	
  	private
		def set_area
      		@area = Area.find(params[:id])
    	end

    	def area_params
      		params.require(:area).permit(:name)
    	end
end

