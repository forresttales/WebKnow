class AlterPublisherProductEnhancements2 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_enhancements, :enhancement_other_b, :boolean, :default => false
    add_column :publisher_product_enhancements, :enhancement_other, :string
    
  end
end
