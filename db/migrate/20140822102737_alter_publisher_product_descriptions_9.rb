class AlterPublisherProductDescriptions9 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_descriptions, :form_update, :timestamp, :default => '2000-01-01 00:00:00'
    
  end
end
