# == Schema Information
#
# Table name: publisher_product_appropriate_ages
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  age_appropriate_1                :boolean          default(FALSE)
#  age_appropriate_2                :boolean          default(FALSE)
#  age_appropriate_3                :boolean          default(FALSE)
#  age_appropriate_4                :boolean          default(FALSE)
#  age_appropriate_5                :boolean          default(FALSE)
#  age_appropriate_6                :boolean          default(FALSE)
#  age_appropriate_7                :boolean          default(FALSE)
#  age_appropriate_8                :boolean          default(FALSE)
#  age_appropriate_9                :boolean          default(FALSE)
#  age_appropriate_10               :boolean          default(FALSE)
#  age_appropriate_11               :boolean          default(FALSE)
#  age_appropriate_12               :boolean          default(FALSE)
#  age_appropriate_13               :boolean          default(FALSE)
#  age_appropriate_14               :boolean          default(FALSE)
#  age_appropriate_15               :boolean          default(FALSE)
#  age_appropriate_16               :boolean          default(FALSE)
#  age_appropriate_17               :boolean          default(FALSE)
#  age_appropriate_adult            :boolean          default(FALSE)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductAppropriateAge < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :age_appropriate_1,
                  :age_appropriate_2,
                  :age_appropriate_3,
                  :age_appropriate_4,
                  :age_appropriate_5,
                  :age_appropriate_6,
                  :age_appropriate_7,
                  :age_appropriate_8,
                  :age_appropriate_9,
                  :age_appropriate_10,
                  :age_appropriate_11,
                  :age_appropriate_12,
                  :age_appropriate_13,
                  :age_appropriate_14,
                  :age_appropriate_15,
                  :age_appropriate_16,
                  :age_appropriate_17,
                  :age_appropriate_adult,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_appropriate_ages")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_appropriate_ages_id_seq RESTART WITH 1")
  end
  
end
