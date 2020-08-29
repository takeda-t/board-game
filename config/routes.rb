Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :create] do
    member do
      get :join
      get :accept
    end
  end
  
  resources :groups, only: [:show, :new, :create]
  
  resources :group_users, only: [:create, :destroy]
end
