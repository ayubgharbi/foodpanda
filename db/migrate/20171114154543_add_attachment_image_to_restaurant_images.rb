class AddAttachmentImageToRestaurantImages < ActiveRecord::Migration
  def self.up
    change_table :restaurant_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :restaurant_images, :image
  end
end
