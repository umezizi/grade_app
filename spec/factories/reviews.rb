FactoryBot.define do
  factory :review do
    title { "テストタイトル" }
    content { "テスト本文" }
    grade { 1 }
    breadth { 1 }
    wall_height { 1 }
    congestion { 1 }
    gym
    user
  end

  factory :rev2, class: Review do
    title { "テストタイトル2" }
    content { "テスト本文2" }
    grade { 2 }
    breadth { 2 }
    wall_height { 2 }
    congestion { 2 }
    gym
    user
  end
end
