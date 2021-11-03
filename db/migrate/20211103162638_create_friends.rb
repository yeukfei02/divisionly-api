class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends, id: :uuid do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.integer :phone_number, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
