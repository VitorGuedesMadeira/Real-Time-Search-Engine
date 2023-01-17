Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :analytics

  # Defines the root path route ("/")
  root "articles#index"
end
