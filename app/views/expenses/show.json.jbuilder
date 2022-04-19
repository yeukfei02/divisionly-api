# frozen_string_literal: true

json.message @message
if @expense.present?
  json.expense do
    json.id @expense.id
    json.description @expense.description
    json.amount @expense.amount
    json.split_method @expense.split_method

    if @expense.split_method == 'you_paid_and_split_equally' || @expense.split_method == 'friend_paid_and_split_equally'
      json.your_amount @expense.amount / 2
      json.owe_amount @expense.amount / 2
    end

    json.image do
      json.url @expense.image.url
      json.filename @expense.image.filename
    end

    json.user do
      json.id @expense.user.id
      json.email @expense.user.email
      json.first_name @expense.user.first_name
      json.last_name @expense.user.last_name
      json.created_at @expense.user.created_at
      json.updated_at @expense.user.updated_at
    end

    json.friend do
      json.id @expense.friend.id
      json.name @expense.friend.name
      json.description @expense.friend.description
      json.phone_number @expense.friend.phone_number
      json.created_at @expense.friend.created_at
      json.updated_at @expense.friend.updated_at
    end

    json.group do
      json.id @expense.group.id
      json.name @expense.group.name
      json.description @expense.group.description
      json.group_type @expense.group.group_type
      json.created_at @expense.group.created_at
      json.updated_at @expense.group.updated_at
    end

    json.expense_category do
      json.id @expense.expense_category.id
      json.expense_category_group @expense.expense_category.expense_category_group
      json.name @expense.expense_category.name

      json.image do
        json.url @expense.expense_category.image.url
        json.filename @expense.expense_category.image.filename
      end

      json.created_at @expense.expense_category.created_at
      json.updated_at @expense.expense_category.updated_at
    end

    json.currency do
      json.id @expense.currency.id
      json.symbol @expense.currency.symbol
      json.name @expense.currency.name
      json.symbol_native @expense.currency.symbol_native
      json.decimal_digits @expense.currency.decimal_digits
      json.rounding @expense.currency.rounding
      json.code @expense.currency.code
      json.name_plural @expense.currency.name_plural
      json.created_at @expense.currency.created_at
      json.updated_at @expense.currency.updated_at
    end

    json.created_at @expense.created_at
    json.updated_at @expense.updated_at
  end
end
json.error @error if @error.present?
