Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    member do
      patch :update
    end
  end
  resources :users, only: [:show]
end