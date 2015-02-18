class AlterLogPublishes1 < ActiveRecord::Migration
  def change

    add_column :log_publishers, :publisher_id, :integer
    add_column :log_publishers, :user_id, :integer
    
    add_index :log_publishers, "publisher_id"
    add_index :log_publishers, "user_id"

  end
end
