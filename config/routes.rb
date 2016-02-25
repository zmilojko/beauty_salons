Rails.application.routes.draw do



  root to: 'salons#index'

  authenticate :user do
    get "/user/create_new" => "users#new_custom", as: "new_user"
    post "/user/create" => "users#create_custom", as: "users"
    delete "/user/delete/:id" => "users#delete_custom", as: "delete_user"

    # protect salon route
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

    get "/users" => "users#list", as: "list_users"
  end

  devise_for :users

  # allow salon routes
  get "/saloni" => "salons#index", as: "salons"
  get "/saloni/pretraga" => "salons#search", as: "search_salons"
  get "/salon/:id" => "salons#show", as: "salon"

  # allow service routes
  get "/usluga/:id" => "services#show", as: "service"

end
