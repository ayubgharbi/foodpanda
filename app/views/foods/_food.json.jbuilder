json.extract! food, :id, :title, :description, :image_url, :price, :created_at, :updated_at
json.url food_url(food, format: :json)
