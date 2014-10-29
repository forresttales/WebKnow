class AlterPublisherProductDescriptions10 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_descriptions, :poster_print_purchase, :boolean, :default => false
    add_column :publisher_product_descriptions, :poster_pin_web, :boolean, :default => false
    add_column :publisher_product_descriptions, :poster_pin_purchase, :boolean, :default => false
    
  end
end
