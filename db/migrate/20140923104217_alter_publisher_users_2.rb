class AlterPublisherUsers2 < ActiveRecord::Migration
  def change
    
    add_column :publisher_users, :publisher_member_id, :integer, :default => 0
        
  end
end
