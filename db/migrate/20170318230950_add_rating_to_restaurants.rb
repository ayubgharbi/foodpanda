class AddRatingToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :rating, :string
  end
end
