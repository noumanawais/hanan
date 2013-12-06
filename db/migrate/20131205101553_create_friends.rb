class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :friend_email
      t.string :email

      t.timestamps
    end
  end
end
