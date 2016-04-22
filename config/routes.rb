Rails.application.routes.draw do
  root to: "items#index"

  resources :items, only: [:index]
  resource :cart, only: [:create, :show, :destroy, :update]
  resource :users, only: [:create]
  resources :orders, only: [:create, :index]

  get "/login", to: "users#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  namespace :admin do
    get "dashboard", to: "dashboard#show"
  end
  get "/:name", to: "categories#show", as: :category
end
