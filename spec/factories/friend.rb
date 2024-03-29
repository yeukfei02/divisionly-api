# frozen_string_literal: true

FactoryBot.define do
  factory :friend do
    association :user
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    phone_number { Faker::Number.number(digits: 8).to_s }
    user_id { user.id }
  end
end
