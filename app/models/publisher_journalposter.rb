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
#  journalposter_metadata     :string(255)
#  poster                     :integer
#  poster_text                :string(255)
#  has_journalposter_logo     :boolean          default(FALSE)
#  has_journalposter_prodshot :boolean          default(FALSE)
#  has_journalposter_metadata :boolean          default(FALSE)
#  has_purchase               :boolean          default(FALSE)
#  purchase_date              :datetime
#  poster_type                :integer          default(0)
#  poster_coord_id            :integer          default(0)
#  id_map                     :integer          default(0)
#  area                       :integer          default(0)
#  area_pos                   :integer          default(0)
#

class PublisherJournalposter < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :name_journalposter,
                  :has_description,
                  :journalposter_logo,
                  :has_journalposter_logo,
                  :has_journalposter_prodshot,
                  :journalposter_metadata,
                  :has_journalposter_metadata,
                  :has_purchase,
                  :purchase_date,
                  :poster,
                  :poster_text,
                  :poster_type, #integer 1 to 5
                  :id_map,
                  :area,
                  :area_pos,
                  :poster_coord_id,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher
  has_one :publisher_journalposter_description
  has_many :publisher_journalposter_images
  has_many :publisher_journalposter_prodshots
  # has_one :publisher_journalposter_metadatatag
  has_one :publisher_journalposter_purchase
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_journalposters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_journalposters_id_seq RESTART WITH 1")
  end

  
end
