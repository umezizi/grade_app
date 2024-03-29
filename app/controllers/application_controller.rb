class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン前のページを保存する
  before_action :store_current_location, unless: :devise_controller?

  # ログイン後に元のページに戻る
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  private

    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント編集の時にname,profile,imageのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
    end

    # ログイン前のページを保存する
    def store_current_location
      store_location_for(:user, request.url)
    end

    def user_login?
      redirect_to(root_url) unless user_signed_in?
    end

    def admin_user?
      redirect_to(root_url) unless current_user.admin?
    end
end
