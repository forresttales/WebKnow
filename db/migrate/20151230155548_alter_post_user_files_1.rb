class AlterPostUserFiles1 < ActiveRecord::Migration
  def change
    
    add_column :post_user_files, :user_id, :integer, :default => nil
    add_column :post_user_files, :post_user_id, :integer, :default => nil
    add_column :post_user_files, :file, :string, :default => nil
    add_column :post_user_files, :file_name, :string, :default => nil
    add_column :post_user_files, :order, :integer, :default => nil
    
  end
end
