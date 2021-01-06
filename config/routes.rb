Rails.application.routes.draw do
  
  root to: "static#home"
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :houses, only: %i[index show create]
  post 'favorites', to: 'users#new_favorite'
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  
end