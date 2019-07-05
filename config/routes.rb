Rails.application.routes.draw do
  get 'users/new'
  get 'about', to: 'pages#about'
  root to: 'gyms#index'

  # ヘルスチェック用のroutesを設定
  resources :health_check, only: [:index]
end
