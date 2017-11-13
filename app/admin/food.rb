ActiveAdmin.register Food do

permit_params :title, :description, :image_url, :price, :user_id, :restaurant_id, :category_id


end
