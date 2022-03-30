Rails.application.routes.draw do
  root "teams#index"

  resources :teams
end