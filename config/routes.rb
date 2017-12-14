Rails.application.routes.draw do
  
  
  ActiveAdmin.routes(self)
  get 'welcome/index'

  get 'admin' => 'admin#index'

  controller :sessions do 
    get 'login' => :new 
    post 'login' => :create
    delete 'logout' => :destroy
  end

    get 'auth/:provider/callback' => 'sessions#fb_create'
    get 'auth/failure' => redirect('/')
    get 'signout_fb' => 'sessions#fb_destroy'



  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users
  resources :areas 
  resources :line_items
  resources :carts
  resources :restaurants do 
      resources :restaurant_images
      resources :reviews, except: [:show]
      resources :orders
      resources :categories do 
        resources :foods
      end
      resources :foods
      resources :opening_hours   
  end
  get 'restaurants/info/:id', to: 'restaurants#info', as: :restaurant_info

  root 'welcome#index'

  resources :foods do
  	get :who_bought, on: :member
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
