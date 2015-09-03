class AlterPublisherProductManifests6 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_manifests, :product_headline, :string, :default => ""
        
  end
end
