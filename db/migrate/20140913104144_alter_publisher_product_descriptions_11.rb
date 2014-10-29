class AlterPublisherProductDescriptions11 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_descriptions, :corporate_logo_url, :string
    
  end
end
