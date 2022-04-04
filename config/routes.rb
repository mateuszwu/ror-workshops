Rails.application.routes.draw do
  devise_for :users
  resources :teams do
    collection do
      get 'index_search'
    end
  end
  resources :users, only: %i[show edit update]
  resources :rounds do
    resources :matches
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#show'
end
