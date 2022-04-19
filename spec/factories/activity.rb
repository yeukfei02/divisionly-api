# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    association :user
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    user_id { user.id }
  end
end
