Rails.application.routes.draw do
  resources :items, only: [:index]
  resource :cart, only: [:create, :show, :destroy]
  get "/:name", to: "categories#show", as: :category
  get "/undo/:item_id", to: "carts#undo", as: :undo
end
