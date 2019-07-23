FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    grade { 1 }
    breadth { 1 }
    wall_height { 1 }
    congestion { 1 }
    gym { nil }
    user { nil }
  end
end
