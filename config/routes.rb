Rails.application.routes.draw do
  get '/login', to: "sessions#login", as: "login"
  post '/login', to: "sessions#verification", as: "verify"
  get '/filter', to: "users#filter", as: "filter"
  delete '/logout', to: "sessions#destroy", as: "logout"
  get '/', to: "sessions#login"

  resources :user_concerts, except: :index
  resources :bands, only: [:index, :show]
  resources :users, except: [:index]
  resources :concerts, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
