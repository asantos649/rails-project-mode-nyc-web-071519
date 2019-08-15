Rails.application.routes.draw do
  resources :user_concerts, except: [:index]
  resources :bands, only: [:index, :show]
  resources :users, except: [:index]
  resources :concerts, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
