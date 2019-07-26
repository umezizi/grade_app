class User < ApplicationRecord
  require 'open-uri'

  has_many :reviews
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "guest_user_id",
                                  dependent:   :destroy
  has_many :favorite_gyms, through: :active_relationships
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
  def user_image_resize(size)
    return self.image.variant(resize: size).processed
  end

  # URLから画像を取得
  def download_oauth_image
    return unless oauth_image_url

    file = open(oauth_image_url)
    image.attach(io: file,
                 filename: "profile_image.#{file.content_type_parse.first.split("/").last}",
                 content_type: file.content_type_parse.first)
  end

  def feed
    guest_users_ids = "SELECT guest_user_id FROM relationships
                     WHERE favorite_gym_id IN (SELECT favorite_gym_id FROM relationships
                                                      WHERE guest_user_id = :user_id)"
    Post.where("user_id IN (#{guest_users_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def like(gym)
    favorite_gyms << gym
  end

  def unlike(gym)
    active_relationships.find_by(favorite_gym_id: gym.id).destroy
  end

  def favorite?(gym)
    favorite_gyms.include?(gym)
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
