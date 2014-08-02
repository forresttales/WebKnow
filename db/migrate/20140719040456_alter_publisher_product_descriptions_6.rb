class AlterPublisherProductDescriptions6 < ActiveRecord::Migration
  def change
    
      remove_column("publisher_product_descriptions", "enhancements_index")
      remove_column("publisher_product_descriptions", "enhancements")
      remove_column("publisher_product_descriptions", "updating_refresh_rate_index")
      remove_column("publisher_product_descriptions", "updating_type_index")
      remove_column("publisher_product_descriptions", "character_index")

      add_column :publisher_product_descriptions, :enhancement, :string
    
  end
end
