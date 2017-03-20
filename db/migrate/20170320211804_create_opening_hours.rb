class CreateOpeningHours < ActiveRecord::Migration[5.0]
  def change
    create_table :opening_hours do |t|
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
