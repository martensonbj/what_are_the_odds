Rails.application.routes.draw do

  root to: 'home#index'
  get '/dashboard', to: 'users#show'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'add_guess', to: 'challenges#edit'

  resources :users, only: [:edit, :update]

  resources :challenges

end
