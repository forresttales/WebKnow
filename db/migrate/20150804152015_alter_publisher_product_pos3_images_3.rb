class AlterPublisherProductPos3Images3 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_pos3_images, :width, :integer, :default => 0
    add_column :publisher_product_pos3_images, :height, :integer, :default => 0    
    
  end
end
