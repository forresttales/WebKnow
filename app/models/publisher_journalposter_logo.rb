# == Schema Information
#
# Table name: publisher_journalposter_logos
#
#  id                         :integer          not null, primary key
#  publisher_id               :integer
#  publisher_journalposter_id :integer
#  image_name                 :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#

class PublisherJournalposterLogo < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_journalposter_id,
                  :image_name,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher_journalposter
  
end
