Rails.application.routes.draw do
  devise_for :users
  root to:'events#index'
  resources :events do
    resources :comments, only: :create
  end
  resources :tasks
  resources :user, only: :show
end
