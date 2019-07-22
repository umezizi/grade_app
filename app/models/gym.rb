class Gym < ApplicationRecord
  has_one_attached :gym_image
  validates :gym_name, presence: true, length: { maximum: 50 },
             uniqueness: { case_sensitive: false }
  validates :details, length: { maximum: 500 }

  # ジム画像のリサイズ
  def gym_image_resize
    return self.gym_image.variant(resize: '400x400').processed
  end

end
