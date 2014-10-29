class AlterPublisherProductPlatform1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_platforms, :platform_other_b, :boolean, :default => false
        
  end
end
