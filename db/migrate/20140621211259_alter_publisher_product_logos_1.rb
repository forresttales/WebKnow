class AlterPublisherProductLogos1 < ActiveRecord::Migration
  def change
    
      remove_column("publisher_product_logos", "image_name")    

      add_column :publisher_product_logos, :image, :string    
    
  end
end
