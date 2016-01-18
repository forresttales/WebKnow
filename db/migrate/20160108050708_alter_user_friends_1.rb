class AlterUserFriends1 < ActiveRecord::Migration
  def change
    
    add_column :user_friends, :user_id, :integer, :default => 0
    add_column :user_friends, :friend_id, :integer, :default => 0
    add_column :user_friends, :status, :integer, :default => 0
    add_column :user_friends, :status_text, :string, :default => ""
    add_column :user_friends, :user_initiate_id, :integer, :default => 0
    
  end
end
