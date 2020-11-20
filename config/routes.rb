Rails.application.routes.draw do
  devise_for :users
  root to: "counts#index"
  resources :counts
  resources :users, only: [:show]
end
