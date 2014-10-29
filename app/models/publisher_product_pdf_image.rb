# == Schema Information
#
# Table name: publisher_product_pdf_images
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  image                            :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  publisher_product_pdf_id         :integer
#

class PublisherProductPdfImage < ActiveRecord::Base
  
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :publisher_product_pdf_id,
                  :image
  
  
  mount_uploader :image, PublisherProductPdfImageUploader
  
  belongs_to :publisher_product_pdf
  


  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_pdf_images")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_pdf_images_id_seq RESTART WITH 1")
  end

  
end
