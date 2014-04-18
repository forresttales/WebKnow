# == Schema Information
#
# Table name: publisher_journalposters
#
#  id                         :integer          not null, primary key
#  publisher_id               :integer
#  name_journalposter         :string(255)
#  has_description            :boolean          default(FALSE)
#  created_at                 :datetime
#  updated_at                 :datetime
#  journalposter_logo         :string(255)
#  has_journalposter_logo     :boolean
#  journalposter_metadata     :string(255)
#  has_journalposter_metadata :boolean
#  has_purchase               :boolean
#  poster                     :integer
#  poster_text                :string(255)
#

class PublisherJournalposter < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :name_journalposter,
                  :has_description,
                  :journalposter_logo,
                  :has_journalposter_logo,
                  :journalposter_metadata,
                  :has_journalposter_metadata,
                  :has_purchase,
                  :poster,
                  :poster_text,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher
  has_one :publisher_journalposter_description
  has_one :publisher_journalposter_logo
  has_one :publisher_journalposter_metadatatag
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_journalposters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_journalposters_id_seq RESTART WITH 1")
  end

  
end
