class AddDeliveryMinimumToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :delivery_minimum, :decimal, precision:8, scale: 2
  end
end
