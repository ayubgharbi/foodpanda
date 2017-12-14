class RestaurantImagesController < ApplicationController
  before_action :set_restaurant_image, only: [:edit, :update, :destroy]
  before_action :set_restaurant

  def new
    @restaurant_image = RestaurantImage.new
  end

  def edit
  end

  def create
    @restaurant_image = RestaurantImage.new(restaurant_image_params)
    @restaurant_image.restaurant_id = @restaurant.id

    respond_to do |format|
      if @restaurant_image.save
        format.html { redirect_to restaurant_info_path(@restaurant) }
        format.json { render :show, status: :created, location: @restaurant_image }
      else
        format.html { render :new }
        format.json { render json: @restaurant_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant_image.update(restaurant_image_params)
        format.html { redirect_to @restaurant }
        format.json { render :show, status: :ok, location: @restaurant_image }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant_image.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_image
      @restaurant_image = RestaurantImage.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_image_params
      params.require(:restaurant_image).permit(:image)
    end
end
