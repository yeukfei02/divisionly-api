# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    iso { Faker::Lorem.word }
    name { Faker::Lorem.word }
    nice_name { Faker::Lorem.word }
    iso3 { Faker::Lorem.word }
    num_code { Faker::Number.number(digits: 2) }
    phone_code { Faker::Number.number(digits: 2) }
  end
end
