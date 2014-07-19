Rails.application.routes.draw do
  root "traits#index"
  resources :users
  resources :traits

  post '/users/login', to: 'users#login'
  get '/users/:id/sign_out', to: 'users#sign_out', as: :sign_out

end
