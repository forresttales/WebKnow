class AlterPublisherProductFileType1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_file_types, :file_type_other_b, :boolean, :default => false
    
  end
end
