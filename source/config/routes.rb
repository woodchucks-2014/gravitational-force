Rails.application.routes.draw do
  root "traits#index"
  resources :users
  resources :traits

  post '/users/login', to: 'users#login'



end
