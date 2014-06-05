# == Schema Information
#
# Table name: publisher_journalposter_purchases
#
#  id                         :integer          not null, primary key
#  id_user                    :integer
#  publisher_id               :integer
#  publisher_journalposter_id :integer
#  message                    :text
#  price                      :integer
#  price_owed                 :integer
#  price_paid                 :integer
#  price_refund               :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#

class PublisherJournalposterPurchase < ActiveRecord::Base
  
  attr_accessible :id,
                  :id_user,
                  :publisher_id,
                  :publisher_journalposter_id,
                  :message,
                  :price,
                  :price_owed,
                  :price_paid,
                  :price_refund,
                  :created_at,
                  :updated_at
  
  
  belongs_to :publisher_journalposter
  

  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_journalposters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_journalposters_id_seq RESTART WITH 1")
  end


  
end
