class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities, id: :uuid do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
