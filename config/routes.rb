Rails.application.routes.draw do
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :events
  root "sessions#new"
  get "signup", to: "user#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "auto", to: "sessions#create", as: "auto"
end
