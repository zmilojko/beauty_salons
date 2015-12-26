Rails.application.routes.draw do
  root to: 'salons#index'
  resources :prices
  resources :prices
  resources :services
  resources :salons
end
