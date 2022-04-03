Rails.application.routes.draw do
  devise_for :users
  resources :teams
  resources :rounds
  resources :users, only: %i[show edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#show'
end
