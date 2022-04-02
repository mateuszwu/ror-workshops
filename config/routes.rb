Rails.application.routes.draw do
  devise_for :users
  resources :teams
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    resources :teams
    resources :users
  end

  root 'home#index'
end
