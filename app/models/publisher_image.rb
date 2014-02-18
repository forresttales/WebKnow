# == Schema Information
#
# Table name: publisher_images
#
#  id           :integer          not null, primary key
#  publisher_id :integer
#  image_name   :string(100)
#  primary      :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

class PublisherImage < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :image_name,
                  :primary,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher

  
end
