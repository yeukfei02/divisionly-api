# frozen_string_literal: true

class AddIsAdminInUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
