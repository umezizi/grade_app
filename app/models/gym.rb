class Gym < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "favorite_gym_id",
                                   dependent:   :destroy
  has_many :guest_users, through: :passive_relationships

  default_scope -> { order(created_at: :desc) }
  has_one_attached :gym_image
  validate  :validate_gym_image
  validates :gym_name, presence: true, length: { maximum: 50 },
             uniqueness: { case_sensitive: false }
  validates :details, length: { maximum: 500 }
  validates :address,   presence: true

  # アドレスから経度・緯度を取得
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # ジム画像のリサイズ
  def gym_image_resize(size)
    return self.gym_image.variant(resize: size).processed
  end

  private

    # アップロード画像について、3MB以下 かつ jpeg,pngファイルのみ許可
    def validate_gym_image
      if !gym_image.attached?
        errors.add(:gym_image, 'ファイルが指定されていません')
      elsif gym_image.blob.byte_size > 3.megabytes
        gym_image.purge
        errors.add(:gym_image, 'エラー ファイルサイズは3MBが上限です')
      elsif !image_type?
        gym_image.purge
        errors.add(:gym_image, 'エラー JPEG,PNGファイルを指定ください')
      end
    end

    def image_type?
      %w[image/jpg image/jpeg image/png].include?(gym_image.blob.content_type)
    end
end
