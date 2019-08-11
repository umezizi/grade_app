FactoryBot.define do
  factory :gym do
    gym_name { "MyGym" }
    prefecture { "東京都" }
    address { "新宿区西新宿2-8-1" }
    details { "備考テスト" }
    latitude { 35.6812 }
    longitude { 139.767 }
  end
end
