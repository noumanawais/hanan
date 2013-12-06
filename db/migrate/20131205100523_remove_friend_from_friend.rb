class RemoveFriendFromFriend < ActiveRecord::Migration
  def up
    remove_column :friends, :friend
  end

  def down
    add_column :friends, :friend, :string
  end
end
