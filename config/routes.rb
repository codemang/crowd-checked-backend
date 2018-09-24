Rails.application.routes.draw do
  devise_for :users
  root 'launch#index'
  namespace :api do
    resources :highlights
  end
end
