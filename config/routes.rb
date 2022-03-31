Rails.application.routes.draw do
  devise_for :users
  root "teams#index"

  resources :teams
end