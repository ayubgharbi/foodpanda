require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :foods
  include ActiveJob::TestHelper


  test "buying a food" do 
  	start_order_count = Order.count 
	pizza = foods(:pizza)

	get "/"
	assert_response :success 
	assert_select 'h1', "Menu"

	post '/line_items', params: { food_id: pizza.id }, xhr: true
	assert_response :success

	cart = Cart.find(session[:cart_id])
	assert_equal 1, cart.line_items.size 
	assert_equal pizza, cart.line_items[0].food 

	get "/orders/new"
	assert_response :success
	assert_select 'legend', 'Please Enter Your Details'

	perform_enqueued_jobs do
		post "/orders", params: {
			order: {
				name: 		"Dave Thomas", 
				address: 	"123 The Street",
				email: 		"dave@example.com", 
				pay_type: 	"Check"
			}
		}

		follow_redirect! 

		assert_response :success
		assert_select 'h1', "Menu"
		cart = Cart.find(session[:cart_id])
		assert_equal 0, cart.line_items.size

		assert_equal start_order_count + 1, Order.count 
		order = Order.last 

		assert_equal "Dave Thomas", 		order.name
		assert_equal "123 The Street", 		order.address
		assert_equal "dave@example.com", 	order.email 
		assert_equal "Check",				order.pay_type

		assert_equal 1, order.line_items.size 
		line_items = order.line_items[0] 
		assert_equal pizza, line_items.food

		mail = ActionMailer::Base.deliveries.last
		assert_equal ["dave@example.com"], mail.to 
		assert_equal 'Sam Rubyy <justeat@example.com>', mail[:from].value
		assert_equal "justEat Order Confirmation", mail.subject
	end

  end

end


