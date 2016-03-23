Rails.application.routes.draw do
  devise_for :users
  # resources :users
  # resources :products
  resources :admin
  # get '/admin'

  resources :categories do
    resources :products
  end
  
  root 'index#index'

  get 'index' => 'index#index', as: :index
end
