require 'test_helper'

class FoodTest < ActiveSupport::TestCase
	fixtures :foods
  test "food attributes must not be empty" do 
  	food = Food.new 
  	assert food.invalid?
  	assert food.errors[:title].any?
  	assert food.errors[:description].any?
  	assert food.errors[:price].any?
  	assert food.errors[:image_url].any?
  end

  test "food price must be positive" do 
  	food = Food.new(title: 		"My Food Title", 
  					description: "yyy",
  					image_url: 	 "zzz.jpg")
  	food.price = -1 
  	assert food.invalid?
  	assert_equal ["must be greater than or equal to 0.01"], food.errors[:price]

  	food.price = 0 
  	assert food.invalid?
  	assert_equal ["must be greater than or equal to 0.01"], food.errors[:price]

  	food.price = 1
  	assert food.valid?
  end

  def new_food(image_url)
  	Food.new(title: 		"My Food Title",
  			 description: 	"yyy",
  			 price: 		1, 
  			 image_url: 	image_url)
  end

  test "image_url" do 
  	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
  	bad = %w{ fred.doc fred.gif/more fred.gif.more }

  	ok.each do |name|
  		assert new_food(name).valid?, "#{name} shouldn't be invalid"
  	end

  	bad.each do |name|
  		assert new_food(name).invalid?, "#{name} shouldn't be valid"
  	end
  end

  test "food is not valid without a unique title" do 
  	food = Food.new(title: foods(:pizza).title, 
  					   description: "yyy", 
  					   price: 		1, 
  					   image_url: 	"fred.gif")
  	assert food.invalid?
  	assert_equal ["has already been taken"], food.errors[:title]
  end
end