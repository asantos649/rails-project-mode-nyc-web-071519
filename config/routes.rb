Rails.application.routes.draw do
  get '/', to: "application#login", as: "login"
  post '/login', to: "application#verification", as: "verify"

  resources :user_concerts, except: [:index, :show]
  resources :bands, only: [:index, :show]
  resources :users, except: [:index]
  resources :concerts, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
