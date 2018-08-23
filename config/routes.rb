Rails.application.routes.draw do
  root 'pages#home'
  namespace :api do
    resources :highlights
  end
end
