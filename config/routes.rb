Rails.application.routes.draw do
  root to: "items#index"

  get "/items", to: "items#index"
  post "/cart", to: "carts#create"
  get "/cart", to: "carts#show"
  delete "/cart", to: "carts#destroy"
  patch "/cart", to: "carts#update"
  post "/users", to: "users#create"
  post "/orders", to: "orders#create"
  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show", as: :order

  get "/login", to: "users#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "/dashboard", to: "orders#index"

  get "/admin/dashboard", to: "admin/dashboard#show"
  patch "/admin/items/:id/retire", to: "admin/items#retire", as: :admin_retire
  patch "/items/:id/activate", to: "admin/items#activate", as: :admin_activate
  patch "/admin/orders/:id/cancel", to: "admin/orders#cancel", as: :admin_cancel
  get "admin/items", to: "admin/items#index"
  get "admin/items/new", to: "admin/items#new", as: :new_admin_item
  post "admin/items", to: "admin/items#create"
  get "admin/items/:id/edit", to: "admin/items#edit", as: :edit_admin_item
  patch "admin/items/:id", to: "admin/items#update", as: :admin_item
  get "admin/orders", to: "admin/orders#index", as: :admin_orders
  patch "admin/orders/:id", to: "admin/orders#update", as: :admin_order
  get "admin/categories/new", to: "admin/categories#new", as: :new_admin_category
  post "admin/categories", to: "admin/categories#create"

  get "/:name", to: "categories#show", as: :category
end
