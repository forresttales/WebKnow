# == Schema Information
#
# Table name: publisher_product_topics
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_product_id :integer
#  publisher_id         :integer
#  topic_text           :text             default("")
#

class PublisherProductTopic < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :topic_text,   
                  :created_at,
                  :updated_at 


                  
  
  belongs_to :publisher_product

  # config.active_record.default_timezone = :local
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_topics")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_topics_id_seq RESTART WITH 1")
  end

  
end
