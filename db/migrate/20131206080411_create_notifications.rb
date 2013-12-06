class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :sender
      t.string :receiver
      t.integer :status

      t.timestamps
    end
  end
end
