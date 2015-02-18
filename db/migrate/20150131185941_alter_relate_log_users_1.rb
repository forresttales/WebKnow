class AlterRelateLogUsers1 < ActiveRecord::Migration
  def change
    
    add_column :relate_log_users, :follower_id, :integer
    add_column :relate_log_users, :followed_id, :integer
    
  end
end
