Rails.application.routes.draw do
  root "traits#index"
  resources :users
  resources :traits

  post '/users/login', to: 'users#login'
  get '/users/:id/logout', to: 'users#sign_out'

end
