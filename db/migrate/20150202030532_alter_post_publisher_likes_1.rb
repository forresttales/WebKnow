class AlterPostPublisherLikes1 < ActiveRecord::Migration
  def change
    
    add_column :post_publisher_likes, :post_publisher_id, :integer
    add_column :post_publisher_likes, :user_id, :integer
    
    add_index :post_publisher_likes, "post_publisher_id"
    add_index :post_publisher_likes, "user_id"
    
  end
end
