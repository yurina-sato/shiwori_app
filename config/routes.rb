Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :trips, only: [:show, :new, :create, :edit, :update, :destroy]

  root to: "users#show"
end
