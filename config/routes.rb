Rails.application.routes.draw do
  root to: 'salons#index'
  resources :prices

  get "/saloni" => "salons#index", as: "salons"
  post "/saloni" => "salons#create"
  get "/salon/new" => "salons#new", as: "new_salon"
  get "/salon/:id/edit" => "salons#edit", as: "edit_salon"
  get "/salon/:id" => "salons#show", as: "salon"
  patch "/salon/:id" => "salons#update"
  put "/salon/:id" => "salons#update"
  delete "/salon/:id" => "salons#destroy"

  get "/usluge" => "services#index", as: "services"
  post "/usluge" => "services#create"
  get "/usluga/new" => "services#new", as: "new_service"
  get "/usluga/:id/edit" => "services#edit", as: "edit_service"
  get "/usluga/:id" => "services#show", as: "service"
  patch "/usluga/:id" => "services#update"
  put "/usluga/:id" => "services#update"
  delete "/usluga/:id" => "services#destroy"

end
