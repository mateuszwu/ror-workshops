Rails.application.routes.draw do
  devise_for :users
  resources :teams
  resources :users, only: %i[show edit update]
  resources :rounds
  root 'home#show'
end
