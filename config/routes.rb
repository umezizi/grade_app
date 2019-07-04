Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  root to: 'gyms#index'
  # ヘルスチェック用のrouteを設定
  resources :health_check, only: [:index]
end
