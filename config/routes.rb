Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index]
  resource :cart, only: [:create, :show]
  resource :users, only: [:create]
  get "/login", to: "users#new"
  post "/login", to: "sessions#create"
  get "/dashboard", to: "users#show"
  get "/:name", to: "categories#show", as: :category
end
