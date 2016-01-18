class AlterUserFriendships2 < ActiveRecord::Migration
  def change

    remove_column :user_friendships, :friend_id
    add_column :user_friendships, :user_friend_id, :integer, :default => 0
    
  end
end
