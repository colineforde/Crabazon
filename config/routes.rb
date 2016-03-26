Rails.application.routes.draw do
  # devise_for :users
  resources :admin, only: :index

  namespace 'categories' do 
    get 'search'
  end

  get 'cart' => 'cart#index', :as => 'cart_index'
  post 'cart/add/:id' => 'cart#add', :as => 'cart_add'
  delete 'cart/remove(/:id(/:all))' => 'cart#delete', :as => 'cart_delete'

  resources :categories do
    resources :products, only: :index
  end

  resources 'products', except: :index
  
  post 'visitors/contact', to: 'visitors#contact'
  get 'visitors', to: 'visitors#index'
  
  devise_for :users, controllers: { registrations: "registrations" }

  root 'index#index'

  get 'index' => 'index#index', as: :index
end
