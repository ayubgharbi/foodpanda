class AddRestaurantIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :restaurant_id, :integer
  end
end
