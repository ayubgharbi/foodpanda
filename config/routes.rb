Rails.application.routes.draw do
  
  
  ActiveAdmin.routes(self)
  get 'welcome/index'

  get 'admin' => 'admin#index'

  controller :sessions do 
    get 'login' => :new 
    post 'login' => :create
    delete 'logout' => :destroy
  end


  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'


  resources :users do 
    resources :restaurants
  end
  
  

  resources :line_items 
  resources :restaurants do 
      resources :carts
      resources :reviews, except: [:show]
      resources :orders
      resources :categories do 
        resources :foods
      end
      resources :foods
      resources :opening_hours
  end

  root 'welcome#index'

  resources :foods do
  	get :who_bought, on: :member
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
