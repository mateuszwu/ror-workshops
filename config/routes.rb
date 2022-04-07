Rails.application.routes.draw do
  # get 'users/edit'
  devise_for :users
  resources :teams
  resources :users, only: %i[show edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root 'admin_panel#index'
    resources :bets
    resources :teams
    resources :users
    resources :rounds do
      resources :matches
    end
  end

  root 'home#index'
end
