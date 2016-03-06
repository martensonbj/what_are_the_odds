Rails.application.routes.draw do

  root to: 'home#index'
  get '/dashboard', to: 'users#show'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'add_guess', to: 'challenges#edit'

post 'texts/send_text_message' => 'texts#send_text_message'
resources :users, only: [:edit, :update]

resources :challenges
resources :posts

end
