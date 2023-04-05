Rails.application.routes.draw do
  resources :users
  resources :recipes
  # POST /signup
  post "/signup", to: "users#create"
  # stay logged in
  get "/me", to: "users#show"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # GET /recipes and POST /recipes
  resources :recipes, only: [:index, :create]
end
