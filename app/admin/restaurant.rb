ActiveAdmin.register Restaurant do
	permit_params :name, :address, :city, :image, :rating, :estimated_delivery_time, area_ids:[]
end
