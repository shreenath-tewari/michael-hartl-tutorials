Rails.application.routes.draw do

  # Routes for sessions_controller

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # Routes for users_controller

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  resources :users

  # Routes for static_pages_controller

  root "static_pages#home"
  get '/help', to: "static_pages#help"
  get '/about', to: "static_pages#about"
  get '/contact', to: "static_pages#contact"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
