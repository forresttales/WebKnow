class AlterPublisherProductManifests7 < ActiveRecord::Migration
  def change
    
    remove_column :publisher_product_manifests, :name_product
    
    add_column :publisher_product_manifests, :product_name, :string
    
  end
end
