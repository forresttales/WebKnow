# == Schema Information
#
# Table name: publisher_product_corporate_logos
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  image                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherProductCorporateLogo < ActiveRecord::Base
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_product_id,
                  :image,
                  :created_at,
                  :updated_at 
  
  
  mount_uploader :image, PublisherProductCorporateLogoUploader
  
  belongs_to :publisher_product
  


  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_corporate_logos")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_corporate_logos_id_seq RESTART WITH 1")
  end


  
end
