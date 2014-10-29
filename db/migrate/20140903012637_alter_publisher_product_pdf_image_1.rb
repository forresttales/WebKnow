class AlterPublisherProductPdfImage1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_pdf_images, :publisher_product_pdf_id, :integer
        
  end
end
