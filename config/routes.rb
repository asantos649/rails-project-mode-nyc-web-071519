Rails.application.routes.draw do
  get '/', to: "application#login", as: "login"
  post '/login', to: "application#verification", as: "verify"
  get '/filter', to: "users#filter", as: "filter"

  resources :user_concerts, except: :index
  resources :bands, only: [:index, :show]
  resources :users, except: [:index]
  resources :concerts, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
