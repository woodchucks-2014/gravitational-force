Rails.application.routes.draw do
  root "users#welcome"
  resources :users do
    resources :ratings
  end

  post '/users/login', to: 'users#login'
  get '/users/:id/sign_out', to: 'users#sign_out', as: :sign_out

end
