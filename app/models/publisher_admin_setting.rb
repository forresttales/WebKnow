# == Schema Information
#
# Table name: publisher_admin_settings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  publisher_id :integer
#  background   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class PublisherAdminSetting < ActiveRecord::Base
  
  attr_accessible :id,
                  :user_id,
                  :publisher_id,
                  :background,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher
  
  
end
