FactoryBot.define do
  factory :post do
    comment { "テストコメント" }
    user
  end
end
