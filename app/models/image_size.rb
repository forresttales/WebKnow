# == Schema Information
#
# Table name: image_sizes
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class ImageSize < ActiveRecord::Base

  attr_accessible :id,
                  :name,
                  :image,
                  :created_at,
                  :updated_at 
  

  mount_uploader :image, ImageSizeUploader
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM image_sizes")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE image_sizes_id_seq RESTART WITH 1")
  end

end
