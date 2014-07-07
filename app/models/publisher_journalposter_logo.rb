# == Schema Information
#
# Table name: publisher_journalposter_logos
#
#  id                         :integer          not null, primary key
#  publisher_id               :integer
#  publisher_journalposter_id :integer
#  image                      :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#

class PublisherJournalposterLogo < ActiveRecord::Base
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_journalposter_id,
                  :image,
                  :crop_x,
                  :crop_y,
                  :crop_w,
                  :crop_h,                  
                  :created_at,
                  :updated_at 
  
  
  #attr_accessible :gallery_id, :name, :image, :remote_image_url
  #belongs_to :gallery
  #mount_uploader :image, ImageUploader

  mount_uploader :image, PublisherJournalposterLogoUploader
  
  belongs_to :publisher_journalposter
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_journalposter_logos")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_journalposter_logos_id_seq RESTART WITH 1")
  end
  
  
end
