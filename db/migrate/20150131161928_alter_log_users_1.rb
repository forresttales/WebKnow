class AlterLogUsers1 < ActiveRecord::Migration
  def change
    
    add_column :log_users, :user_id, :integer
    
    add_index :log_users, "user_id"
    
  end
end
