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

  resources :cart, only: [:update, :index] do
    post :increment, to: 'cart#increment'
    post :decrement, to: 'cart#decrement'
  end

  resources :users do 
    resources :orders
  end

  root 'index#index'

  get 'index' => 'index#index', as: :index
end
