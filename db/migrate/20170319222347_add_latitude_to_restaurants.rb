class AddLatitudeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :latitude, :float
  end
end
