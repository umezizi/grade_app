Rails.application.routes.draw do
  root to: 'top#index'
  resources :health_check, only: [:index]
end
