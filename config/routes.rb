Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'restaurant#index', as: 'restaurant_index'

  resources :foods do
  	get :who_bought, on: :member
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
