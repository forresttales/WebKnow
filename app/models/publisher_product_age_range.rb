# == Schema Information
#
# Table name: publisher_product_age_ranges
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_id         :integer
#  publisher_product_id :integer
#  age_from             :integer          default(0)
#  age_to               :integer          default(0)
#  required             :boolean          default(FALSE)
#

class PublisherProductAgeRange < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :required,
                  :age_from,
                  :age_to




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_age_ranges")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_age_ranges_id_seq RESTART WITH 1")
  end

  
end
