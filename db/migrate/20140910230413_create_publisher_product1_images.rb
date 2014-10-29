class CreatePublisherProduct1Images < ActiveRecord::Migration
  def change
    create_table :publisher_product1_images do |t|
      
      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.string "image"

      t.timestamps
    end

      add_index("publisher_product1_images", "publisher_id")
      add_index("publisher_product1_images", "publisher_product_id")
      
  end
end
