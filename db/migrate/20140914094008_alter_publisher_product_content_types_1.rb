class AlterPublisherProductContentTypes1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_content_types, :content_type_other_b, :boolean, :default => false
        
  end
end
