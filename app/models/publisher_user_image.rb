# == Schema Information
#
# Table name: publisher_user_images
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer          default(0)
#  publisher_id      :integer          default(0)
#  publisher_user_id :integer          default(0)
#  image             :string(255)
#  image_name        :string(255)
#  primary           :boolean          default(FALSE)
#  order             :integer          default(0)
#  crop_x            :integer          default(0)
#  crop_y            :integer          default(0)
#  crop_w            :integer          default(0)
#  crop_h            :integer          default(0)
#  width             :integer          default(0)
#  height            :integer          default(0)
#

class PublisherUserImage < ActiveRecord::Base
  
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  attr_accessible :user_id,
                  :publisher_id,
                  :publisher_user_id,
                  :image,
                  :image_name,
                  :primary,
                  :order,
                  :crop_x,
                  :crop_y,
                  :crop_w,
                  :crop_h,
                  :width,
                  :height,
                  :created_at,
                  :updated_at 
  

  mount_uploader :image, PublisherUserImageUploader
  
  belongs_to :publisher_user
  
  
  


  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_user_images")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_user_images_id_seq RESTART WITH 1")
  end



  
end
