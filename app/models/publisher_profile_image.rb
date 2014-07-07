# == Schema Information
#
# Table name: publisher_profile_images
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  publisher_id :integer
#  image        :string(255)
#  image_name   :string(255)
#  primary      :boolean          default(FALSE)
#  order        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

class PublisherProfileImage < ActiveRecord::Base
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  attr_accessible :id,
                  :user_id,
                  :publisher_id,
                  :image,
                  :image_name,
                  :primary,
                  :order,
                  :created_at,
                  :updated_at 
  
  
  #attr_accessible :gallery_id, :name, :image, :remote_image_url
  #belongs_to :gallery
  #mount_uploader :image, ImageUploader

  mount_uploader :image, PublisherProfileUploader
  
  belongs_to :publisher
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_profile_images")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_profile_images_id_seq RESTART WITH 1")
  end

  
end
