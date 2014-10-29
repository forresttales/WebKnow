class AlterPublisherMembers1 < ActiveRecord::Migration
  def change

    add_column :publisher_members, :user_id, :integer, :default => 0    
    add_column :publisher_members, :publisher_id, :integer, :default => 0
    add_column :publisher_members, :publisher_user_id, :integer, :default => 0

    add_index("publisher_members", "publisher_id")
    
  end
end
