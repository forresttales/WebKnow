class AlterPublisherProducts2 < ActiveRecord::Migration
  def change
    
    remove_column :publisher_products, :name_product
    
    add_column :publisher_products, :product_name, :string
    
  end
end
