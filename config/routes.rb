Rails.application.routes.draw do
  root to: 'salons#index'
  resources :prices
  resources :prices
  resources :services

  get "/saloni" => "salons#index", as: "salons"
  post "/saloni" => "salons#create"
  get "/salon/new" => "salons#new", as: "new_salon"
  get "/salon/edit/:id" => "salons#edit", as: "edit_salon"
  get "/salon/:id" => "salons#show", as: "salon"
  patch "/salon/:id" => "salons#update"
  put "/salon/:id" => "salons#update"
  delete "/salon/:id" => "salons#destroy"

end
