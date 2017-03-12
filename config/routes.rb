Rails.application.routes.draw do
  root 'restaurant#index', as: 'restaurant_index'

  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
