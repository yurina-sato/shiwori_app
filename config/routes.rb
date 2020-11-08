Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :trips, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :schedules, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :events, only: [:show, :new, :create, :edit, :update, :destroy]
    end

    resources :lists, only: [:show, :new, :create, :edit, :update, :destroy]

  end

  root to: "users#show"
end
