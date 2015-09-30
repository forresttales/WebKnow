class AlterPublisherProductPos5Images1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_pos5_images, :user_id, :integer, :default => 0    
    add_column :publisher_product_pos5_images, :publisher_id, :integer, :default => 0
    add_column :publisher_product_pos5_images, :publisher_product_id, :integer, :default => 0
    add_column :publisher_product_pos5_images, :image, :string
    add_column :publisher_product_pos5_images, :image_name, :string
    add_column :publisher_product_pos5_images, :primary, :boolean, :default => false
    add_column :publisher_product_pos5_images, :order, :integer, :default => 0
    add_column :publisher_product_pos5_images, :crop_x, :integer, :default => 0
    add_column :publisher_product_pos5_images, :crop_y, :integer, :default => 0
    add_column :publisher_product_pos5_images, :crop_w, :integer, :default => 0
    add_column :publisher_product_pos5_images, :crop_h, :integer, :default => 0
    add_column :publisher_product_pos5_images, :width, :integer, :default => 0
    add_column :publisher_product_pos5_images, :height, :integer, :default => 0    

    add_index :publisher_product_pos4_images, "publisher_product_id", :name => 'index_publisher_product_pos5_images_on_publisher_product_id'    
    
  end
end
