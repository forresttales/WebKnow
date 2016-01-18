class AlterUserFriendships1 < ActiveRecord::Migration
  def change
    
    add_column :user_friendships, :user_id, :integer, :default => 0
    add_column :user_friendships, :friend_id, :integer, :default => 0
    add_column :user_friendships, :status, :integer, :default => 0
    add_column :user_friendships, :status_text, :string, :default => ""
    add_column :user_friendships, :accepted_at, :datetime, :default => nil
    add_column :user_friendships, :invitation_at, :datetime, :default => nil
    add_column :user_friendships, :user_initiate_id, :integer, :default => 0
                
  end
end
