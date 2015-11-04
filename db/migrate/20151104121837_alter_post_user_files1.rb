class AlterPostUserFiles1 < ActiveRecord::Migration
  def change
  	add_column :post_user_files, :user_id, :integer, :default => 0
  	add_column :post_user_files, :post_user_id, :integer, :default => 0
  	add_column :post_user_files, :file, :string
  	add_column :post_user_files, :file_name, :string
  	add_column :post_user_files, :order, :integer, :default => 0
  end
end
