class OpeningHoursController < ApplicationController
  before_action :set_opening_hour, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:index, :show, :new, :edit, :create]

  def index
    @opening_hours = OpeningHour.where('restaurant_id = ?', params[:restaurant_id]).order('day ASC')
  end

  def show
  end

  def new
    @opening_hour = OpeningHour.new
  end

  def edit
  end

  def create
    @opening_hour = @restaurant.opening_hours.create(opening_hour_params)

    respond_to do |format|
      if @opening_hour.save
        format.html { redirect_to restaurant_opening_hour_path(@opening_hour.restaurant_id, @opening_hour.id) }
        format.json { render :show, status: :created, location: @opening_hour }
      else
        format.html { render :new }
        format.json { render json: @opening_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @opening_hour.update(opening_hour_params)
        format.html { redirect_to restaurant_opening_hour_path(@opening_hour.restaurant_id, @opening_hour.id) }
        format.json { render :show, status: :ok, location: @opening_hour }
      else
        format.html { render :edit }
        format.json { render json: @opening_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @opening_hour.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_opening_hours_path }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_opening_hour
      @opening_hour = OpeningHour.find(params[:id])
    end

    def opening_hour_params
      params.require(:opening_hour).permit(:day, :start_time, :end_time)
    end
end
