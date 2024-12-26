Rails.application.routes.draw do
  resources :lists do
    resources :tasks, only: [ :new, :create, :edit, :update, :destroy ]
  end
end
