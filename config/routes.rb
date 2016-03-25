Rails.application.routes.draw do
  devise_for :users
  resources :admin

  namespace 'categories' do 
    get 'search'
  end

  resources :categories do
    resources :products, except: [:new, :create]
  end

  resources 'products', only: [:new, :create]
  
  post 'visitors/contact', to: 'visitors#contact'
  get 'visitors', to: 'visitors#index'

  root 'index#index'

  get 'index' => 'index#index', as: :index
end
