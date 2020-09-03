Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  post 'items/new'
  resources :users, only: [:new, :create, :update]
  resources :items, only: [:new, :create, :edit, :show, :update, :destoroy]
end