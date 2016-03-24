Rails.application.routes.draw do
  devise_for :users
  resources :admin
  post 'visitors', to: 'visitors#contact'
  get 'visitors/contact', to: 'visitors#contact' 
  # resources :visitors

  resources :categories do
    resources :products
  end
  
  root 'index#index'

  get 'index' => 'index#index', as: :index
end
