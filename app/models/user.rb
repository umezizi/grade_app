class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]


  # Oauth認証データでユーザーを検索。いない場合ユーザーを新規作成。
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(username: auth.info.name,
                         email: User.dummy_email(auth),
                         provider: auth.provider,
                         uid: auth.uid,
                         password: Devise.friendly_token[0, 20])
                         # remote_image_url: auth.info.image.gsub('http', 'https'))

    user
  end

  private

    # Oauth認証でユーザー登録する際に使用するユニークなメールアドレスを作成
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end

end
