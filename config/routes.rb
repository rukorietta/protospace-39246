Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show]
end
