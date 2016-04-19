Rails.application.routes.draw do
  resources :items, only: [:index]
  resource :cart, only: [:create, :show]
  get "/:name", to: "categories#show", as: :category
end
