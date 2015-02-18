class AlterRelateLogPublishers1 < ActiveRecord::Migration
  def change
    
    add_column :relate_log_publishers, :follower_id, :integer
    add_column :relate_log_publishers, :followed_id, :integer
    
  end
end
