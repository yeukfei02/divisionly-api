FactoryBot.define do
  factory :activity do
    association :user
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    user_id { user.first.id }
  end
end
