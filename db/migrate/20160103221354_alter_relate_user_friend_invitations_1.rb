class AlterRelateUserFriendInvitations1 < ActiveRecord::Migration
  def change
    
    add_column :relate_user_friend_invitations, :user_friend_from_id, :integer, :default => 0
    add_column :relate_user_friend_invitations, :user_friend_to_id, :integer, :default => 0
        
  end
end
