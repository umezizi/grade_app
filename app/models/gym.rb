class Gym < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :gym_image
  validate  :validate_gym_image
  validates :gym_name, presence: true, length: { maximum: 50 },
             uniqueness: { case_sensitive: false }
  validates :details, length: { maximum: 500 }

  # ジム画像のリサイズ
  def gym_image_resize(size)
    return self.gym_image.variant(resize: size).processed
  end

  private

    def validate_gym_image
      unless gym_image.attached?
        errors.add(:gym_image, 'ファイルが指定されていません。')
      end
    end
end
