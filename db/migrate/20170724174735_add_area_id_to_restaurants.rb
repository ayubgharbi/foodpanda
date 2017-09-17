class AddAreaIdToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :area_id, :integer
  end
end
