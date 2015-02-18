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
  

  belongs_to :publisher_product

  
  mount_uploader :image, PublisherProductCorporateLogoUploader
  
  # validates :image, 
    # :presence => true #, 
    # # :file_size => { :maximum => 5.megabytes.to_i}   
  # validates_integrity_of :image
  # validates_processing_of :image
  
  
  # def image_integrity_validation
    # # errors[:avatar] << "should be less than 5MB" if avatar.size > 5.megabytes
    # errors[:image] << "Wrong file type"
  # end  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_corporate_logos")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_corporate_logos_id_seq RESTART WITH 1")
  end


  
end
