class AddExpenseCategoryIdInExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :expense_category_id, :uuid
    add_foreign_key :expenses, :expense_categories, column: :expense_category_id
  end
end
