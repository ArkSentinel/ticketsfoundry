Rails.application.routes.draw do
  root "dashboard#index"
  devise_for :users
  
  resources :tickets do
    resources :comments, only: [:create]
  end

  resources :categories, only: [:index, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :create, :edit, :update]
end
