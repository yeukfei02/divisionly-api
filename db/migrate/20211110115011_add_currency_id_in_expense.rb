class AddCurrencyIdInExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :currency_id, :uuid
    add_foreign_key :expenses, :currencies, column: :currency_id
  end
end
