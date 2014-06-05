# == Schema Information
#
# Table name: paintings
#
#  id         :integer          not null, primary key
#  gallery_id :integer
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Painting < ActiveRecord::Base
  
  attr_accessible :gallery_id, :name, :image, :remote_image_url

  belongs_to :gallery

  mount_uploader :image, ImageUploader
  
end
