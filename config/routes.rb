Rails.application.routes.draw do
  
  get 'welcome/index'

  get 'admin' => 'admin#index'

  controller :sessions do 
    get 'login' => :new 
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :restaurants do 
      resources :reviews, except: [:show, :index]
      resources :foods
  end

  root 'welcome#index'

  resources :foods do
  	get :who_bought, on: :member
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
