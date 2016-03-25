Rails.application.routes.draw do
  # devise_for :users
  resources :admin
  post 'visitors', to: 'visitors#contact'
  get 'visitors/contact', to: 'visitors#contact' 
  # resources :visitors

  resources :categories do
    resources :products
  end
  
  post 'visitors/contact', to: 'visitors#contact'
  get 'visitors', to: 'visitors#index'
  
  devise_for :users, controllers: { registrations: "registrations" }

  root 'index#index'

  get 'index' => 'index#index', as: :index
end
