class AddRestaurantIdToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :restaurant_id, :integer
  end
end
