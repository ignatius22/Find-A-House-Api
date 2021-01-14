Rails.application.routes.draw do
  
  root to: "static#home"
  resources :registrations, only: [:create]
  resources :houses, only: %i[index show create]
  resources :users, only: %i[show]
  post 'favorites', to: 'users#new_favorite'
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  get '/user_is_authed', to: 'auth#user_is_authed'
  
  
end