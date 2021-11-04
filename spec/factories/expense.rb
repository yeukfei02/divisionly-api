FactoryBot.define do
  factory :expense do
    association :user
    association :group
    description { Faker::Lorem.sentence }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    split_method { Expense.split_methods['you_paid_and_split_equally'] }
    user_id { user.first.id }
    group_id { group.first.id }
  end
end
