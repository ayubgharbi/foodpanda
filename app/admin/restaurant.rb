ActiveAdmin.register Restaurant do
	permit_params :name, :address, :city, :area, :estimated_delivery_time
end
