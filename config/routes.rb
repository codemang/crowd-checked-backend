Rails.application.routes.draw do
  root 'launch#index'
  namespace :api do
    resources :highlights
  end
end
