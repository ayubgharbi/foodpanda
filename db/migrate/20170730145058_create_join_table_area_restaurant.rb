class CreateJoinTableAreaRestaurant < ActiveRecord::Migration[5.0]
  def change
    create_join_table :areas, :restaurants do |t|
      # t.index [:area_id, :restaurant_id]
      # t.index [:restaurant_id, :area_id]
    end
  end
end
