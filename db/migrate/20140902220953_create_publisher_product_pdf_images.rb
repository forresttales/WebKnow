class CreatePublisherProductPdfImages < ActiveRecord::Migration
  def change
    create_table :publisher_product_pdf_images do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.string "image"

      t.timestamps
    end
  end
end
