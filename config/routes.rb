Rails.application.routes.draw do
  root 'products#index'
  resources :products
  get '/admin', to: 'products#admin'
end
