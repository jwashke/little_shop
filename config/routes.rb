Rails.application.routes.draw do
  resources :items, only: [:index]
  get "/:name", to: "categories#show", as: :category
end
