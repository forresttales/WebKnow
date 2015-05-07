# == Schema Information
#
# Table name: publisher_product_market_targets
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  market_target_1      :boolean          default(FALSE)
#  market_target_2      :boolean          default(FALSE)
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherProductMarketTarget < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :market_target_1,
                  :market_target_2,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_market_targets")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_market_targets_id_seq RESTART WITH 1")
  end

  
end
