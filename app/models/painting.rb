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
  
  attr_accessible :image, :name
  
  mount_uploader :image, ImageUploader

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

  
end
