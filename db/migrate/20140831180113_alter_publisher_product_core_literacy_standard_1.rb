class AlterPublisherProductCoreLiteracyStandard1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_core_literacy_standards, :id_standard, :integer, :default => 0
    
  end
end
