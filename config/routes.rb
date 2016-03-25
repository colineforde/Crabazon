Rails.application.routes.draw do
  # devise_for :users
  resources :admin, only: :index

  namespace 'categories' do 
    get 'search'
  end

  namespace 'users' do 
    get 'cart'
  end

  resources :categories do
    resources :products, except: [:new, :create]
  end

  resources 'products', only: [:new, :create]
  
  post 'visitors/contact', to: 'visitors#contact'
  get 'visitors', to: 'visitors#index'
  
  devise_for :users, controllers: { registrations: "registrations" }

  root 'index#index'

  get 'index' => 'index#index', as: :index
end
