class AddFriendIdInExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :friend_id, :uuid
    add_foreign_key :expenses, :friends, column: :friend_id
  end
end
