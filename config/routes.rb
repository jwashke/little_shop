Rails.application.routes.draw do
  root to: "items#index"

  resources :items, only: [:index]
  resource :cart, only: [:create, :show, :destroy, :update]
  resource :users, only: [:create]
  resources :invoices, only: [:create, :index]
  resources :orders, only: [:create, :index]

  get "/login", to: "users#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"

  namespace :admin do
    get "/dashboard", to: "dashboard#show"
    patch "/items/:id/retire", to: "items#retire", as: :retire
    patch "/items/:id/activate", to: "items#activate", as: :activate
    patch "/orders/:id/cancel", to: "orders#cancel", as: :cancel
    resources :items, only: [:index]
    resources :orders, only: [:index, :update]
  end

  get "/:name", to: "categories#show", as: :category
end
