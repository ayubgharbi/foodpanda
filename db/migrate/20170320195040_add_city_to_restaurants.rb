class AddCityToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :city, :string
  end
end
