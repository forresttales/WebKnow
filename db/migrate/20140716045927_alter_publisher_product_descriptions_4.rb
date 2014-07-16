class AlterPublisherProductDescriptions4 < ActiveRecord::Migration
  def change
    
      remove_column("publisher_product_descriptions", "slugged")    
      add_column :publisher_product_descriptions, :slugged, :string, :default => ""    
    
  end
end
