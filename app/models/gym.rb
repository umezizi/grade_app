class Gym < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "favorite_gym_id",
                                   dependent:   :destroy
  has_many :guest_users, through: :passive_relationships

  default_scope -> { order(updated_at: :desc) }
  has_one_attached :gym_image
  validate  :validate_gym_image
  validates :gym_name, presence: true, length: { maximum: 50 },
             uniqueness: { case_sensitive: false }
  validates :details, length: { maximum: 500 }
  validates :prefecture, presence: true
  validates :address,    presence: true

  # アドレスから経度・緯度を取得
  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?, if: :prefecture_changed?

  def full_address
    prefecture + address
  end

  # ジム画像のリサイズ
  def gym_image_resize(size)
    return self.gym_image.variant(combine_options:{
                          resize:"#{size}>", extent: size,
                          background: "white", gravity: :center}).processed
  end

  private

    # アップロード画像について、3MB以下 かつ jpeg,pngファイルのみ許可
    def validate_gym_image
      return unless gym_image.attached?
      if gym_image.blob.byte_size > 3.megabytes
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
