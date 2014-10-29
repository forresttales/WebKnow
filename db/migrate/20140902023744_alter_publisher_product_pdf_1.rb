class AlterPublisherProductPdf1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_pdfs, :name_file, :string
      add_column :publisher_product_pdfs, :image, :string
    
  end
end
