Rails.application.routes.draw do
  root to: 'sessions#new'
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
end


  # It accepts a parameter :provider in case you had multiple providers
  # auth/failure is requested by the provider if the user fails to accept the requested permissions 
