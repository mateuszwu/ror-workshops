Rails.application.routes.draw do
  resources :teams do
    resources :players
  end
  resources :posts do
    resources :comments
  end
  devise_for :users
  resources :users, only: %i[show edit update]
  resources :rounds
  root 'home#show'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
