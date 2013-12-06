class AddFriendEmailToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :friend_email, :string
  end
end
