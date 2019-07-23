class Review < ApplicationRecord
  belongs_to :gym
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :gym_id,  presence: true
  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
end
