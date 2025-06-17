Rails.application.routes.draw do
  root "customers#index"

  devise_for :users

  get "users/index"
  get "rents/new"
  get "rents/create"

  resources :users, only: [ :index, :edit, :update, :destroy ]

  resources :customers do
    collection do
      get :search
    end
  end

  resources :equipaments do
    resources :rents, only: [ :new, :create ]

    collection do
      get :available
    end

    collection do
      get :search
    end
  end

  resources :orders
end
