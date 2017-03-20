class AddLongitudeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :longitude, :float
  end
end
