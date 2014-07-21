Rails.application.routes.draw do
  root 'gravitates#index'
  resources :users do
    resources :ratings
  end

  get '/test', to: 'users#test'
  post '/users/login', to: 'users#login'
  get '/users/:id/sign_out', to: 'users#sign_out', as: :sign_out

  get '/gravitate', to: 'gravitates#index'
  post '/gravitate', to: 'gravitates#graph'
  get '/filter_request/:request', to: 'gravitates#filter_request'
end
