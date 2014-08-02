class AlterPublisherProductDescriptions8 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_descriptions, :core_literacy_standard, :string
      add_column :publisher_product_descriptions, :core_math_standard, :string
    
  end
end
