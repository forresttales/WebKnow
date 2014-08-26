class AlterPublisherProductEnhancements1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_enhancements, :enhancement_11, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_12, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_13, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_14, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_15, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_16, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_17, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_18, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_19, :boolean, :default => false
      add_column :publisher_product_enhancements, :enhancement_20, :boolean, :default => false

      remove_index :publisher_product_enhancements, name: :index_enhancement_on_publisher_id
      remove_index :publisher_product_enhancements, name: :index_enhancement_on_publisher_product_id
      
      # remove_index :publisher_product_enhancements, :publisher_id, :name => 'index_enhancement_on_publisher_id'
      # remove_index :publisher_product_enhancements, :publisher_product_id, :name => 'index_enhancement_on_publisher_product_id'

      add_index :publisher_product_enhancements, :publisher_id, :name => 'index_enhancement_on_publisher_id'
      add_index :publisher_product_enhancements, :publisher_product_id, :name => 'index_enhancement_on_publisher_product_id'
    
  end
end
