Rails.application.routes.draw do

  devise_for :users



  root to: 'salons#index'

  authenticate :user do
    # protect salon route
    get "/users" => "users#list", as: "list_users"
    get "/salon/:id/edit/prices" => "prices#advanced_edit", as: "edit_salon_price"
    post "/saloni" => "salons#create"
    get "/salon/new" => "salons#new", as: "new_salon"
    patch "/salon/:id" => "salons#update"
    put "/salon/:id" => "salons#update"
    delete "/salon/:id" => "salons#destroy"
    get "/salon/:id/edit" => "salons#edit", as: "edit_salon"

    # protect price routes
    resources :prices

    # protect service routes
    post "/usluge" => "services#create"
    get "/usluge" => "services#index", as: "services"
    get "/usluga/new" => "services#new", as: "new_service"
    get "/usluga/:id/edit" => "services#edit", as: "edit_service"
    patch "/usluga/:id" => "services#update"
    put "/usluga/:id" => "services#update"
    delete "/usluga/:id" => "services#destroy"
  end

  # allow salon routes
  get "/saloni" => "salons#index", as: "salons"
  get "/saloni/pretraga" => "salons#search", as: "search_salons"
  get "/salon/:id" => "salons#show", as: "salon"

  # allow service routes
  get "/usluga/:id" => "services#show", as: "service"

end
