Rails.application.routes.draw do
  resources :customers
  root "equipaments#index"

  get "users/index"
  get "rents/new"
  get "rents/create"

  devise_for :users

  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :equipaments do
    resources :rents, only: [ :new, :create ]
  end
end
