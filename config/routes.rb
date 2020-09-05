Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :create]
  
  resources :groups, only: [:show, :new, :create] do
    resources :messages, only: [:create]
  end
  
  resources :group_users, only: [:create, :destroy]
  
  get "search", to: "toppages#index"
end
