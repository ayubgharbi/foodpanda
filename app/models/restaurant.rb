class Restaurant < ApplicationRecord
	has_many :foods
	has_many :orders
	has_many :reviews


	validates :name, :address, presence: true

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	geocoded_by :address
  	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
