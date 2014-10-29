class CreatePublisherProduct2Images < ActiveRecord::Migration
  def change
    create_table :publisher_product2_images do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.string "image"

      t.timestamps
    end

      add_index("publisher_product2_images", "publisher_id")
      add_index("publisher_product2_images", "publisher_product_id")

  end
end
