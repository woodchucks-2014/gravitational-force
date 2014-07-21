Rails.application.routes.draw do
  root "ratings#index", user_id: 1
  post '/users/login', to: 'users#login'

  resources :users do
    resources :ratings
  end


  get '/users/:id/sign_out', to: 'users#sign_out', as: :sign_out

  get '/gravitate', to: 'gravitates#index'
  post '/gravitate', to: 'gravitates#graph'
  get '/filter_request/:request', to: 'gravitates#filter_request'
end
