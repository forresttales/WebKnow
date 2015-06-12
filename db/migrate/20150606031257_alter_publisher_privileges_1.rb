class AlterPublisherPrivileges1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_privileges, :user_id, :integer
    add_column :publisher_privileges, :publisher_user_id, :integer
    add_column :publisher_privileges, :publisher_id, :integer
    add_column :publisher_privileges, :level_1, :boolean, :default => false
    add_column :publisher_privileges, :level_2, :boolean, :default => false
    add_column :publisher_privileges, :level_3, :boolean, :default => false
    
    add_index :publisher_privileges, :publisher_id
    add_index :publisher_privileges, :publisher_user_id
    
  end
end
