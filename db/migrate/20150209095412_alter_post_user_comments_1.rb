class AlterPostUserComments1 < ActiveRecord::Migration
  def change
    
    add_column :post_user_comments, :post_user_id, :integer
    add_column :post_user_comments, :user_id, :integer
    add_column :post_user_comments, :comment_text, :text, :default => ""    
    
    add_index :post_user_comments, :post_user_id
    add_index :post_user_comments, :user_id
        
  end
end
