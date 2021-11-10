FactoryBot.define do
  factory :expense do
    association :user
    association :group
    association :expense_category
    association :currency
    description { Faker::Lorem.sentence }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    split_method { Expense.expense_split_methods['method_1'] }
    user_id { user.id }
    group_id { group.id }
    expense_category_id { expense_category.id }
    currency_id { currency.id }
  end
end
