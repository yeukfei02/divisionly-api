# frozen_string_literal: true

class AddDeleteAtToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :deleted_at, :timestamp
  end
end
