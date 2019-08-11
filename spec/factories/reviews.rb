FactoryBot.define do
  factory :review do
    title { "テストタイトル" }
    content { "テスト本文" }
    grade { 1.5 }
    breadth { 1.5 }
    wall_height { 1.5 }
    congestion { 1.5 }
    gym
    user
  end
end
