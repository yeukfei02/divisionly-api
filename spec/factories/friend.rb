FactoryBot.define do
  factory :friend do
    association :user
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    phone_number { Faker::Number.number(digits: 8) }
    user_id { user.first.id }
  end
end
