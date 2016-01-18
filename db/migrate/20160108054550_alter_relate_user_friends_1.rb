class AlterRelateUserFriends1 < ActiveRecord::Migration
  def change
    
    add_column :relate_user_friends, :user_id, :integer, :default => 0
    add_column :relate_user_friends, :user_initiate_id, :integer, :default => 0
    
  end
end
