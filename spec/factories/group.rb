# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    association :user
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    group_type { Group.types['trip'] }
    user_id { user.id }
  end
end
