FactoryBot.define do
  pass = Faker::Internet.password(8)

  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {pass}
    password_confirmation {pass}
  end

  factory :tom, class: User do
    name {"tom"}
    email {"tom@example.com"}
    password              {"password"}
    password_confirmation {"password"}
  end
end
