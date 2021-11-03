FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { BCrypt::Password.create('test') }
  end
end
