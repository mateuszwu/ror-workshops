Rails.application.routes.draw do
  # get 'users/edit'
  devise_for :users
  resources :teams
  resources :users, only: %i[show edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    resources :teams
    resources :rounds
    resources :users
  end

  root 'home#index'
end
