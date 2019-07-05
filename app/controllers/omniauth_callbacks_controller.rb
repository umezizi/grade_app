class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # callback処理
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

    # Twitterアカウント情報が登録済みか確認
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
