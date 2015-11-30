class AlterPublisherProductAgeRanges2 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_age_ranges, :required, :boolean, :default => false
        
  end
end
