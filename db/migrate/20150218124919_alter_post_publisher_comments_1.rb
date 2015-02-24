class AlterPostPublisherComments1 < ActiveRecord::Migration
  def change
    
    add_column :post_publisher_comments, :post_publisher_id, :integer
    add_column :post_publisher_comments, :publisher_id, :integer
    add_column :post_publisher_comments, :user_id, :integer
    add_column :post_publisher_comments, :comment_text, :text, :default => ""    
    
    add_index :post_publisher_comments, :post_publisher_id
    add_index :post_publisher_comments, :publisher_id
    add_index :post_publisher_comments, :user_id
    
  end
end
