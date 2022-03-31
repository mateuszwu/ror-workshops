Rails.application.routes.draw do
  devise_for :users
  resources :teams
  # resources :users # chyba nie
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'teams#index'
end
