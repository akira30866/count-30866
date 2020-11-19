Rails.application.routes.draw do
  devise_for :users
  root to: "counts#index"
  resources :counts, only: [:index, :new, :create, :show, :edit, :update]
end
