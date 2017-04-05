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

  resources :users
  resources :orders
  resources :line_items do 
    match :qty, action: :qty, via: [:post, :delete], on: :member #-> url.com/line_items/qty
  end

  resources :carts
  resources :restaurants do 
      resources :reviews, except: [:show]
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
