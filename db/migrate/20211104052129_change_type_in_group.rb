# frozen_string_literal: true

class ChangeTypeInGroup < ActiveRecord::Migration[6.1]
  def change
    rename_column :groups, :type, :group_type
  end
end
