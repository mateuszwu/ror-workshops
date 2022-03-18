Rails.application.routes.draw do
  devise_for :users
  resources :teams
  resources :users, only: %i[show edit update]
  resources :rounds do
    resources :matches, except: %i[index show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
