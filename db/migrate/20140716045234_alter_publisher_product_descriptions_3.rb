class AlterPublisherProductDescriptions3 < ActiveRecord::Migration
  def change
      add_column :publisher_product_descriptions, :slugged, :string    
  end
end
