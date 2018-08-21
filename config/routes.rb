Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get '/dashboard', to: 'dashboard#show'
end