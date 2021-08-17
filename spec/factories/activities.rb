FactoryBot.define do
  factory :activity do
    title { Faker::Lorem.word }
    activity_type { Faker::Lorem.word }
    level { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end
