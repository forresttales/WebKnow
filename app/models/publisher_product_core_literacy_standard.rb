# == Schema Information
#
# Table name: publisher_product_core_literacy_standards
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  dot_not              :string(255)
#  uri                  :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  id_standard          :integer          default(0)
#

class PublisherProductCoreLiteracyStandard < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_product_id,
                  :id_standard,
                  :dot_not,
                  :uri,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_core_literacy_standards")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_core_literacy_standards_id_seq RESTART WITH 1")
  end

  def self.delete_record(publisher_product_id)
      s = "DELETE FROM publisher_product_core_literacy_standards WHERE publisher_product_id=" + publisher_product_id
      self.connection.execute(s)
  end

  
end
