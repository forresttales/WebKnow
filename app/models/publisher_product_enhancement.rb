# == Schema Information
#
# Table name: publisher_product_enhancements
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  enhancement_1                    :boolean          default(FALSE)
#  enhancement_2                    :boolean          default(FALSE)
#  enhancement_3                    :boolean          default(FALSE)
#  enhancement_4                    :boolean          default(FALSE)
#  enhancement_5                    :boolean          default(FALSE)
#  enhancement_6                    :boolean          default(FALSE)
#  enhancement_7                    :boolean          default(FALSE)
#  enhancement_8                    :boolean          default(FALSE)
#  enhancement_9                    :boolean          default(FALSE)
#  enhancement_10                   :boolean          default(FALSE)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductEnhancement < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :enhancement_1,
                  :enhancement_2,
                  :enhancement_3,
                  :enhancement_4,
                  :enhancement_5,
                  :enhancement_6,
                  :enhancement_7,
                  :enhancement_8,
                  :enhancement_9,
                  :enhancement_10,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_enhancements")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_enhancements_id_seq RESTART WITH 1")
  end

  
end
