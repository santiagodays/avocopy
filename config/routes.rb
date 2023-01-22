Rails.application.routes.draw do
  # Root
  root to: 'home#index'
  # File manager Dashboard
  get '/dashboard', to:"dashboard#index"
  # Devise Routes
  devise_for :users
  # Api's
  namespace :api do
    namespace :v1 do
      # Authentication
      post :auth, to:"authentication#create"
      # Copies Generator
      resources :copies, only: [:index, :new, :create, :destroy]
    end
  end
end
