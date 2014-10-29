class AlterPublisherProductPdf2 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_pdfs, :name_pdf, :string
      add_column :publisher_product_pdfs, :attachment, :string
    
  end
end
