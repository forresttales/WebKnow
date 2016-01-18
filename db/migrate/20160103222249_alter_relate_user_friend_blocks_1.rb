class AlterRelateUserFriendBlocks1 < ActiveRecord::Migration
  def change
    
    add_column :relate_user_friend_blocks, :user_id, :integer, :default => 0
    add_column :relate_user_friend_blocks, :user_block_id, :integer, :default => 0
    
  end
end
