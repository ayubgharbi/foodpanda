require 'test_helper'

class RestaurantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurant_index_url
    assert_response :success
    assert_select 'h3', 'Pan Pizza - Margarita'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
