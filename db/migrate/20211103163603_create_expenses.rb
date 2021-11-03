class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses, id: :uuid do |t|
      t.text :description, null: false
      t.float :amount, null: false
      t.text :split_method, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :group, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
