# frozen_string_literal: true

class AddNameInUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :text, null: false, after: :password
    add_column :users, :last_name, :text, null: false, after: :first_name
  end
end
