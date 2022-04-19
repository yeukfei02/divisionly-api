# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups, id: :uuid do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.text :type, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
