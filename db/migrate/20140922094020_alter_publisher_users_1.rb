class AlterPublisherUsers1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_users, :user_id, :integer, :default => 0
    add_column :publisher_users, :publisher_id, :integer, :default => 0

    add_index("publisher_users", "publisher_id")
    
  end
end
