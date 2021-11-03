class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.text :email, null: false, unique: true
      t.text :password, null: false
      t.timestamps
    end
  end
end
