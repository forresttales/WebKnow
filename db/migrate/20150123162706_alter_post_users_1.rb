class AlterPostUsers1 < ActiveRecord::Migration
  def change

    add_column :post_users, :user_id, :integer
    add_column :post_users, :post_text, :text, :default => ""
    
    add_index :post_users, "user_id"
  end
end
