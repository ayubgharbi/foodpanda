class FoodsController < ApplicationController
  skip_before_action :authorize, only: :index
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant
  before_action :set_category 
  before_action :set_reviews
  include CurrentCart
  before_action :set_cart

  # GET /foods
  # GET /foods.json
  def index
    @categories = Category.where(restaurant_id: @restaurant.id).order("created_at DESC")
    if @category
      @foods = @category.foods
    else
      @foods = @restaurant.foods
    end

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end 

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
    @categories = Category.where(restaurant_id: @restaurant.id).order("created_at DESC").all.map{|c| [ c.name, c.id ] }
  end

  # GET /foods/1/edit
  def edit
    @categories = Category.where(restaurant_id: @restaurant.id).order("created_at DESC").all.map{|c| [ c.name, c.id ] }
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id 
    @food.restaurant_id = @restaurant.id

    respond_to do |format|
      if @food.save
        format.html { redirect_to @restaurant }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    @food.category_id = params[:category_id]
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @restaurant, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }

        @foods = Food.all 
        ActionCable.server.broadcast 'foods', html: render_to_string('restaurants/index', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def who_bought 
    @food = Food.find(params[:id])
    @latest_order = @food.orders.order(:updated_at).last 
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_reviews
      @reviews = Review.where(restaurant_id: @restaurant.id).order("created_at DESC")
    end

    def set_food
      @food = Food.find(params[:id])
    end

    def set_restaurant 
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_category
      @category = Category.find(params[:category_id]) if params[:category_id]
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:title, :description, :image_url, :price, :category_id)
    end
end
  