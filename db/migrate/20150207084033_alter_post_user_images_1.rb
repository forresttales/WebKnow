class AlterPostUserImages1 < ActiveRecord::Migration
  def change
    
    add_column :post_user_images, :user_id, :integer, :default => 0
    add_column :post_user_images, :post_user_id, :integer, :default => 0
    add_column :post_user_images, :image, :string
    add_column :post_user_images, :image_name, :string
    add_column :post_user_images, :primary, :boolean, :default => false
    add_column :post_user_images, :order, :integer, :default => 0
    add_column :post_user_images, :crop_x, :integer, :default => 0
    add_column :post_user_images, :crop_y, :integer, :default => 0
    add_column :post_user_images, :crop_w, :integer, :default => 0
    add_column :post_user_images, :crop_h, :integer, :default => 0
    
    add_index :post_user_images, :post_user_id
    
  end
end
