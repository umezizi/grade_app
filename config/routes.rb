Rails.application.routes.draw do
  get 'pages/about'
  root to: 'top#index'
  resources :todos
  resources :health_check, only: [:index]
end
