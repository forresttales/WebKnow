# == Schema Information
#
# Table name: publisher_journalposter_metadatatags
#
#  id                         :integer          not null, primary key
#  publisher_id               :integer
#  publisher_journalposter_id :integer
#  name_metadata              :string(255)
#  text_metadata              :text
#  created_at                 :datetime
#  updated_at                 :datetime
#

class PublisherJournalposterMetadatatag < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_journalposter_id,
                  :name_metadata,
                  :text_metadata,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher_journalposter
  
end
