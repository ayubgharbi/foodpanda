class AddCartIdToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :cart_id, :integer
  end
end
