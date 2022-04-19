# frozen_string_literal: true

FactoryBot.define do
  factory :expense_category do
    expense_category_group { 'Entertainment' }
    name { 'Game' }
  end
end
