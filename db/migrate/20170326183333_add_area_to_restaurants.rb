class AddAreaToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :area, :string
  end
end
