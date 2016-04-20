Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index]
  resource :cart, only: [:create, :show]
  get "/login", to: "sessions#new"
  get "/:name", to: "categories#show", as: :category
end
