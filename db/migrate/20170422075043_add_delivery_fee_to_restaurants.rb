class AddDeliveryFeeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :delivery_fee, :decimal, precision:8, scale: 2
  end
end
