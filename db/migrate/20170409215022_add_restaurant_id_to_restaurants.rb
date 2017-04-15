class AddRestaurantIdToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :restaurant_id, :integer
  end
end
