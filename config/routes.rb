Rails.application.routes.draw do

  root 'homes#index'

  resources :users
  resources :posts

  delete '/logout' => 'homes#destroy', as: :logout
  resources :homes, only: [:new, :create]
end
