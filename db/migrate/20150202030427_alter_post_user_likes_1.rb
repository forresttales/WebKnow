class AlterPostUserLikes1 < ActiveRecord::Migration
  def change
    
    add_column :post_user_likes, :post_user_id, :integer
    add_column :post_user_likes, :user_id, :integer
    
    add_index :post_user_likes, "post_user_id"
    add_index :post_user_likes, "user_id"
    
  end
end
