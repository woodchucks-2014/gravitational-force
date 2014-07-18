Rails.application.routes.draw do
  root "attributes#index"
  resources :users
  resources :attributes

  post '/users/login', to: 'users#login'



end
