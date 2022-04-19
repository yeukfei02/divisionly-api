# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    symbol { '$' }
    name { 'US Dollar' }
    symbol_native { '$' }
    decimal_digits { 2 }
    rounding { 0 }
    code { 'USD' }
    name_plural { 'US dollars' }
  end
end
