class AlterRelateUserFriends2 < ActiveRecord::Migration
  def change
    
    remove_column :relate_user_friends, :user_id
    remove_column :relate_user_friends, :user_initiate_id

    add_column :relate_user_friends, :friend_1_id, :integer, :default => 0
    add_column :relate_user_friends, :friend_2_id, :integer, :default => 0
    
  end
end
