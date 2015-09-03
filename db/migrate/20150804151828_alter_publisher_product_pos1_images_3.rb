class AlterPublisherProductPos1Images3 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_pos1_images, :width, :integer, :default => 0
    add_column :publisher_product_pos1_images, :height, :integer, :default => 0    
    
  end
end
