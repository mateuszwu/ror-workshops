Rails.application.routes.draw do
  # get 'users/edit'
  devise_for :users
  get '/scoreboard', to: 'scoreboard#index'
  resources :teams
  resources :rounds do
    resources :matches do
      resources :bets
    end
  end
  resources :users, only: %i[show edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root 'admin_panel#index'
    resources :teams
    resources :users
    resources :rounds do
      member do
        post :round_summary
      end
      resources :matches
      resources :bets
    end
  end

  root 'home#index'
end
