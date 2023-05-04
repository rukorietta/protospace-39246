Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get 'prototypes/new', to: 'prototypes#new', as: 'new_proto'
end
