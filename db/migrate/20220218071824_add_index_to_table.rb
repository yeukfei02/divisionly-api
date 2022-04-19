# frozen_string_literal: true

class AddIndexToTable < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, name: 'index_users_on_email'
    add_index :users, :password, name: 'index_users_on_password'
    add_index :users, :first_name, name: 'index_users_on_first_name'
    add_index :users, :last_name, name: 'index_users_on_last_name'
    add_index :users, :is_admin, name: 'index_users_on_is_admin'
    add_index :users, :created_at, name: 'index_users_on_created_at'
    add_index :users, :updated_at, name: 'index_users_on_updated_at'

    add_index :groups, :name, name: 'index_groups_on_name'
    add_index :groups, :description, name: 'index_groups_on_description'
    add_index :groups, :group_type, name: 'index_groups_on_group_type'
    add_index :groups, :created_at, name: 'index_groups_on_created_at'
    add_index :groups, :updated_at, name: 'index_groups_on_updated_at'

    add_index :friends, :name, name: 'index_friends_on_name'
    add_index :friends, :description, name: 'index_friends_on_description'
    add_index :friends, :phone_number, name: 'index_friends_on_phone_number'
    add_index :friends, :created_at, name: 'index_friends_on_created_at'
    add_index :friends, :updated_at, name: 'index_friends_on_updated_at'

    add_index :expenses, :description, name: 'index_expenses_on_description'
    add_index :expenses, :amount, name: 'index_expenses_on_amount'
    add_index :expenses, :split_method, name: 'index_expenses_on_split_method'
    add_index :expenses, :expense_category_id, name: 'index_expenses_on_expense_category_id'
    add_index :expenses, :currency_id, name: 'index_expenses_on_currency_id'
    add_index :expenses, :friend_id, name: 'index_expenses_on_friend_id'
    add_index :expenses, :created_at, name: 'index_expenses_on_created_at'
    add_index :expenses, :updated_at, name: 'index_expenses_on_updated_at'

    add_index :activities, :title, name: 'index_activities_on_title'
    add_index :activities, :description, name: 'index_activities_on_description'
    add_index :activities, :created_at, name: 'index_activities_on_created_at'
    add_index :activities, :updated_at, name: 'index_activities_on_updated_at'
    add_index :activities, :deleted_at, name: 'index_activities_on_deleted_at'

    add_index :expense_categories, :name, name: 'index_expense_categories_on_name'
    add_index :expense_categories, :expense_category_group, name: 'index_expense_categories_on_expense_category_group'
    add_index :expense_categories, :created_at, name: 'index_expense_categories_on_created_at'
    add_index :expense_categories, :updated_at, name: 'index_expense_categories_on_updated_at'

    add_index :currencies, :symbol, name: 'index_currencies_on_symbol'
    add_index :currencies, :name, name: 'index_currencies_on_name'
    add_index :currencies, :symbol_native, name: 'index_currencies_on_symbol_native'
    add_index :currencies, :decimal_digits, name: 'index_currencies_on_decimal_digits'
    add_index :currencies, :rounding, name: 'index_currencies_on_rounding'
    add_index :currencies, :code, name: 'index_currencies_on_code'
    add_index :currencies, :name_plural, name: 'index_currencies_on_name_plural'
    add_index :currencies, :created_at, name: 'index_currencies_on_created_at'
    add_index :currencies, :updated_at, name: 'index_currencies_on_updated_at'

    add_index :countries, :iso, name: 'index_countries_on_iso'
    add_index :countries, :name, name: 'index_countries_on_name'
    add_index :countries, :nice_name, name: 'index_countries_on_nice_name'
    add_index :countries, :iso3, name: 'index_countries_on_iso3'
    add_index :countries, :num_code, name: 'index_countries_on_num_code'
    add_index :countries, :phone_code, name: 'index_countries_on_phone_code'
    add_index :countries, :created_at, name: 'index_countries_on_created_at'
    add_index :countries, :updated_at, name: 'index_countries_on_updated_at'
  end
end
