class AddRestaurantIdToRestaurantImages < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant_images, :restaurant_id, :integer
  end
end
