FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { BCrypt::Password.create('test') }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    is_admin { false }
  end
end
