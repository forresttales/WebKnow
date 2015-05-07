# == Schema Information
#
# Table name: issued_publisher_product_ids
#
#  id                       :integer          not null, primary key
#  created_at               :datetime
#  updated_at               :datetime
#  publisher_product_gen_id :integer
#  publisher_product_id     :integer
#  publisher_id             :integer
#

class IssuedPublisherProductId < ActiveRecord::Base
  
  attr_accessible :publisher_product_gen_id,
                  :publisher_product_id,
                  :publisher_id

  
  belongs_to :publisher_product

  
  def self.dbdelete
      self.connection.execute("DELETE FROM issued_publisher_product_ids")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE issued_publisher_product_ids_id_seq RESTART WITH 1")
  end

  
end
