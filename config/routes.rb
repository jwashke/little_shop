Rails.application.routes.draw do
  root to: "items#index"

  # resources :items, only: [:index]
  get "/items", to: "items#index"
  # resource :cart, only: [:create, :show, :destroy, :update]
  post "/cart", to: "carts#create"
  get "/cart", to: "carts#show"
  delete "/cart", to: "carts#destroy"
  patch "/cart", to: "carts#update"
  put "/cart", to: "carts#update"
  # resource :users, only: [:create]
  post "/users", to: "users#create"
  # resources :orders, only: [:create, :index, :show]
  post "/orders", to: "orders#create"
  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show", as: :order

  get "/login", to: "users#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "/dashboard", to: "orders#index"

  # Had to relocate these two out of the namespace because of rails helper naming
  get "/admin/items/new", to: "admin/items#new", as: :new_admin_item
  get "/admin/items/:id/edit", to: "admin/items#edit", as: :edit_admin_item
  namespace :admin do
    get "/dashboard", to: "dashboard#show"
    patch "/items/:id/retire", to: "items#retire", as: :retire
    patch "/items/:id/activate", to: "items#activate", as: :activate
    patch "/orders/:id/cancel", to: "orders#cancel", as: :cancel
    # resources :items, only: [:index, :create, :new, :edit, :update]
    get "/items", to: "items#index"
    post "/items", to: "items#create"
    patch "/items/:id", to: "items#update", as: :item
    # had to remove put or relocate out of namespace again because of rails helper naming

    # resources :orders, only: [:index, :update]
    get "/orders", to: "orders#index"
    patch "/orders/:id", to: "orders#update", as: :order
    put "/orders/:id", to: "orders#update"
    # resources :categories, only: [:new, :create]
    post "/categories", to: "categories#create"
  end
  get "/admin/categories/new", to: "admin/categories#new", as: :new_admin_category

  get "/:name", to: "categories#show", as: :category
end
