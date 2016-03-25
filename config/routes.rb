Rails.application.routes.draw do
  # devise_for :users
  resources :admin, only: :index

  namespace 'categories' do 
    get 'search'
  end

  resources 'carts', only: :index

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
