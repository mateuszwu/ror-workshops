Rails.application.routes.draw do
  devise_for :users
  resources :teams
  resources :users, only: %i[show edit update]
  resources :rounds do
    member do
      post :summarize_round
    end

    resources :matches, except: %i[index show] do
      resources :bets, except: %i[index show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/:year/:number', to: "home#show"
  root 'home#show'
end
