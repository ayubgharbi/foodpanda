class AddEstimatedDeliveryTimeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :estimated_delivery_time, :integer
  end
end
