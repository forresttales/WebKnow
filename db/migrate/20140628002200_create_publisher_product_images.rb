class CreatePublisherProductImages < ActiveRecord::Migration
  def change
    create_table :publisher_product_images do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.string "image"

      t.timestamps
    end

      add_index("publisher_product_images", "publisher_id")
      add_index("publisher_product_images", "publisher_product_id")

  end
end

  # attr_accessible :id,
                  # :publisher_id,
                  # :publisher_product_id,
                  # :image,
                  # :created_at,
                  # :updated_at 
