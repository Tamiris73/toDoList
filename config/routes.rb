Rails.application.routes.draw do
  devise_for :users 
  root "lists#index" 

  resources :lists do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy]
  end
end