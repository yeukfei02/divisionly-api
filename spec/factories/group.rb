FactoryBot.define do
  factory :group do
    association :user
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    type { Group.types['trip'] }
    user_id { user.first.id }
  end
end
