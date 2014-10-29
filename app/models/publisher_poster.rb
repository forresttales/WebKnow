# == Schema Information
#
# Table name: publisher_posters
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  name_poster          :string(255)
#  has_description      :boolean
#  has_image_logo       :boolean
#  has_image_prodshot   :boolean
#  poster_free          :boolean
#  has_purchase         :boolean
#  date_purchase        :datetime
#  poster_type          :integer
#  id_map               :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherPoster < ActiveRecord::Base
  
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
  # has_one :publisher_poster_description
  # has_many :publisher_poster_images
  # has_many :publisher_poster_prodshots
  # # has_one :publisher_journalposter_metadatatag
  # has_one :publisher_poster_purchase
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_posters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_posters_id_seq RESTART WITH 1")
  end

  
end
