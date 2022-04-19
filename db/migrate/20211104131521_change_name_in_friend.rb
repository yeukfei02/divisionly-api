# frozen_string_literal: true

class ChangeNameInFriend < ActiveRecord::Migration[6.1]
  def change
    rename_column :friends, :title, :name
  end
end
