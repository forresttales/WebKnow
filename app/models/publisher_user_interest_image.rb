# == Schema Information
#
# Table name: publisher_user_interest_images
#
#  id                         :integer          not null, primary key
#  created_at                 :datetime
#  updated_at                 :datetime
#  publisher_user_interest_id :integer          default(0)
#  publisher_user_id          :integer          default(0)
#  publisher_id               :integer          default(0)
#  user_id                    :integer          default(0)
#  image                      :string(255)
#  image_name                 :string(255)
#  primary                    :boolean          default(FALSE)
#  order                      :integer          default(0)
#  crop_x                     :integer          default(0)
#  crop_y                     :integer          default(0)
#  crop_w                     :integer          default(0)
#  crop_h                     :integer          default(0)
#

class PublisherUserInterestImage < ActiveRecord::Base
  
  attr_accessible :publisher_user_interest_id,
                  :publisher_user_id,
                  :publisher_id,
                  :user_id,
                  :image,
                  :image_name,
                  :primary,
                  :order,
                  :crop_x,
                  :crop_y,
                  :crop_w,
                  :crop_h,
                  :created_at,
                  :updated_at 
  
  

  mount_uploader :image, PublisherUserPlotImageUploader
  
  belongs_to :publisher_user_interest
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_user_interest_images")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_user_interest_images_id_seq RESTART WITH 1")
  end

  
end
