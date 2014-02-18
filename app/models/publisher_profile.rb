# == Schema Information
#
# Table name: publisher_profiles
#
#  id           :integer          not null, primary key
#  publisher_id :integer
#  name_logo    :string(100)
#  has_logo     :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

class PublisherProfile < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :name_logo,
                  :has_logo,
                  :created_at,
                  :updated_at 
  
                  # pricing_model_index   dd pricing_model

  
  belongs_to :publisher

  
end
