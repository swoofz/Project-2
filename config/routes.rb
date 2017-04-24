Rails.application.routes.draw do

  root 'home#index'

  resources :users
  resources :posts

  delete '/logout' => 'home#destroy', as: :logout
  resources :home, only: [:new, :create]
end
