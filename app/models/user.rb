class User < ApplicationRecord
  require 'open-uri'

  has_one_attached :image
  validate  :validate_image
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]


  # Oauth認証データでユーザーを検索。いない場合ユーザーを新規作成。
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(name: auth.info.name,
                         email: User.dummy_email(auth),
                         provider: auth.provider,
                         uid: auth.uid,
                         password: Devise.friendly_token[0, 20],
                         image_url: auth.info.image.gsub('http', 'https'))
  end

  # プロフィール画像のリサイズ
  def thumbnail
    return self.image.variant(resize: '300x300').processed
  end

  # URLから画像を取得
  def download_oauth_image
    return unless oauth_image_url

    file = open(oauth_image_url)
    image.attach(io: file,
                 filename: "profile_image.#{file.content_type_parse.first.split("/").last}",
                 content_type: file.content_type_parse.first)
  end


  private

    # Oauth認証でユーザー登録する際に使用するユニークなメールアドレスを作成
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end

    # Twitter の画像のオリジナルサイズのURLを取得する
    def oauth_image_url
      image_url&.gsub(/_normal/, '')
    end

    # プロフィール画像について、3MB以下 かつ jpeg,pngファイルのみ許可
    def validate_image
      return unless image.attached?
      if image.blob.byte_size > 3.megabytes
        image.purge
        errors.add(:image, 'エラー ファイルサイズは3MBが上限です')
      elsif !image_type?
        image.purge
        errors.add(:image, 'エラー JPEG,PNGファイルを指定ください')
      end
    end

    def image_type?
      %w[image/jpg image/jpeg image/png].include?(image.blob.content_type)
    end
end
