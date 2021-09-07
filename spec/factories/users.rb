FactoryBot.define do
  factory :user do
    pwd = Faker::Internet.password(min_length: 8)
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { pwd }
    password_confirmation { pwd }
  end
end
