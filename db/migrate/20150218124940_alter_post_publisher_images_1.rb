class AlterPostPublisherImages1 < ActiveRecord::Migration
  def change

    add_column :post_publisher_images, :post_publisher_id, :integer, :default => 0
    add_column :post_publisher_images, :publisher_id, :integer, :default => 0    
    add_column :post_publisher_images, :user_id, :integer, :default => 0
    add_column :post_publisher_images, :image, :string
    add_column :post_publisher_images, :image_name, :string
    add_column :post_publisher_images, :primary, :boolean, :default => false
    add_column :post_publisher_images, :order, :integer, :default => 0
    add_column :post_publisher_images, :crop_x, :integer, :default => 0
    add_column :post_publisher_images, :crop_y, :integer, :default => 0
    add_column :post_publisher_images, :crop_w, :integer, :default => 0
    add_column :post_publisher_images, :crop_h, :integer, :default => 0
    
    add_index :post_publisher_images, :post_publisher_id
    add_index :post_publisher_images, :publisher_id
    add_index :post_publisher_images, :user_id
    
  end
end
