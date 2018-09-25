Rails.application.routes.draw do
  devise_for :users
  root 'launch#index'
  namespace :api do
    resources :highlights
  end

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    post "users/extension_login", to: "users/sessions#extension_login"
  end
end
