Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations:      'users/registrations' }

  root to: 'gyms#index'
  get '/about',   to: 'pages#about'
  resources :users, only: [:show, :index]

  # ヘルスチェック用のroutesを設定
  resources :health_check, only: [:index]
end
