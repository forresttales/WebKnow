# == Schema Information
#
# Table name: publisher_settings
#
#  id           :integer          not null, primary key
#  publisher_id :integer
#  background   :string(100)
#  created_at   :datetime
#  updated_at   :datetime
#

class PublisherSetting < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :background,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher
  
end
