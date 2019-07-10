Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions:           'users/sessions',
                                    registrations:      'users/registrations' }
  resources :users, only: [:show]
  get '/about',   to: 'pages#about'
  root to: 'gyms#index'

  # ヘルスチェック用のroutesを設定
  resources :health_check, only: [:index]
end
