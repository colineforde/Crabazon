Rails.application.routes.draw do
  # devise_for :users
  resources :admin, only: :index

  namespace 'categories' do 
    get 'search'
  end

  resources :categories do
    resources :products, only: :index
  end

  resources 'products', except: :index
  
  post 'visitors/contact', to: 'visitors#contact'
  get 'visitors', to: 'visitors#index'
  
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users do 
    resources :orders do
      resources :order_products
      put 'order_products/:id/add' => 'order_products#add_quantity', :as => 'add_quantity'
      put 'order_products/:id/reduce' => 'order_products#reduce_quantity', :as => 'reduce_quantity'
    end
    # get 'orders' => 'orders#index', :as => 'orders_index'
    # post 'order/add/:id' => 'orders#add', :as => 'orders_add'
    # delete 'orders/remove(/:id(/:all))' => 'orders#delete', :as => 'orders_delete'
  end

  root 'index#index'

  get 'index' => 'index#index', as: :index
end
