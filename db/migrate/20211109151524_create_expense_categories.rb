# frozen_string_literal: true

class CreateExpenseCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_categories, id: :uuid do |t|
      t.text :expense_category_group, null: false
      t.text :name, null: false
      t.timestamps
    end

    insert_expense_categories_data
  end

  def insert_expense_categories_data
    data = [
      {
        'expense_category_group': 'Entertainment',
        'name': 'Games',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Entertainment',
        'name': 'Movies',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Entertainment',
        'name': 'Music',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Entertainment',
        'name': 'Other',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Entertainment',
        'name': 'Sports',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },

      {
        'expense_category_group': 'Food and drink',
        'name': 'Groceries',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Food and drink',
        'name': 'Dining out',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Food and drink',
        'name': 'Other',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Food and drink',
        'name': 'Liquor',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },

      {
        'expense_category_group': 'Home',
        'name': 'Rent',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Mortgage',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Household supplies',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Furniture',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Maintenance',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Other',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Pets',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Services',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Home',
        'name': 'Electronics',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },

      {
        'expense_category_group': 'Life',
        'name': 'Insurance',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Clothing',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Gifts',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Medical expenses',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Other',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Taxes',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Education',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Life',
        'name': 'Childcare',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },

      {
        'expense_category_group': 'Transportation',
        'name': 'Parking',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Car',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Bus/train',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Gas/fuel',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Other',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Plane',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Taxi',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Bicycle',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Transportation',
        'name': 'Hotel',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },

      {
        'expense_category_group': 'Uncategorized',
        'name': 'General',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },

      {
        'expense_category_group': 'Utilities',
        'name': 'Electricity',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Utilities',
        'name': 'Heat/gas',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Utilities',
        'name': 'Water',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Utilities',
        'name': 'TV/Phone/Internet',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Utilities',
        'name': 'Other',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Utilities',
        'name': 'Trash',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      },
      {
        'expense_category_group': 'Utilities',
        'name': 'Cleaning',
        'created_at': Time.zone.now,
        'updated_at': Time.zone.now
      }
    ]
    ExpenseCategory.insert_all(data)
  end
end
