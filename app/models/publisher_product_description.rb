# == Schema Information
#
# Table name: publisher_product_descriptions
#
#  id                   :integer          not null, primary key
#  publisher_product_id :integer
#  publisher_id         :integer
#  created_at           :datetime
#  updated_at           :datetime
#  description_text     :text             default("")
#

class PublisherProductDescription < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :description_text,   
                  :created_at,
                  :updated_at 


                  
  
  belongs_to :publisher_product


  # config.active_record.default_timezone = :local
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_descriptions")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_descriptions_id_seq RESTART WITH 1")
  end

  
end






  # price  :decimal(8, 2)


  # extend FriendlyId
  # friendly_id :id, use: :slugged

  # def id
    # [
      # :id
    # ]
  # end  

  # def to_param
    # "#{id}"
  # end
