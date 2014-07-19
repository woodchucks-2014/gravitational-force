Rails.application.routes.draw do
  root "traits#index"
  resources :users do
    resources :traits
  end

  post '/users/login', to: 'users#login'
  get '/users/:id/sign_out', to: 'users#sign_out', as: :sign_out

end
