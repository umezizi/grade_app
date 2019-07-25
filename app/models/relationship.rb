class Relationship < ApplicationRecord
  belongs_to :guest_user,   class_name: "User"
  belongs_to :favorite_gym, class_name: "Gym"
  validates :guest_user_id,   presence: true
  validates :favorite_gym_id, presence: true
end
