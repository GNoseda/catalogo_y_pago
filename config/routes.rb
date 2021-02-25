Rails.application.routes.draw do
  devise_for :users
  resources :order_items
  resources :orders do
    resources :payments, :only => [:index, :new, :create]
  end
  resources :images
  resources :digitals
  resources :products
  resources :payment_methods
  
  
  root "orders#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
