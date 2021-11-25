Rails.application.routes.draw do
  resources :properties
  resources :types
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:"home#index"
  get "/categories/:id", to:"categories#show"
end
