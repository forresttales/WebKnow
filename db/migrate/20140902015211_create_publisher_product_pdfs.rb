class CreatePublisherProductPdfs < ActiveRecord::Migration
  def change
    create_table :publisher_product_pdfs do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      
      t.timestamps
    end
  end
end
