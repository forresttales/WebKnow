class AlterPostPublishers1 < ActiveRecord::Migration
  def change
    
    add_column :post_publishers, :user_id, :integer
    add_column :post_publishers, :publisher_id, :integer
    add_column :post_publishers, :post_text, :text, :default => ""
    
    add_index :post_publishers, "publisher_id"
    add_index :post_publishers, "user_id"
    
  end
end
