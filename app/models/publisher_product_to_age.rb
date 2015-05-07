# == Schema Information
#
# Table name: publisher_product_to_ages
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_id         :integer
#  publisher_product_id :integer
#  age_1                :boolean          default(FALSE)
#  age_2                :boolean          default(FALSE)
#  age_3                :boolean          default(FALSE)
#  age_4                :boolean          default(FALSE)
#  age_5                :boolean          default(FALSE)
#  age_6                :boolean          default(FALSE)
#  age_7                :boolean          default(FALSE)
#  age_8                :boolean          default(FALSE)
#  age_9                :boolean          default(FALSE)
#  age_10               :boolean          default(FALSE)
#  age_11               :boolean          default(FALSE)
#  age_12               :boolean          default(FALSE)
#  age_13               :boolean          default(FALSE)
#  age_14               :boolean          default(FALSE)
#  age_15               :boolean          default(FALSE)
#  age_16               :boolean          default(FALSE)
#  age_17               :boolean          default(FALSE)
#  age_18               :boolean          default(FALSE)
#  age_19               :boolean          default(FALSE)
#  age_20               :boolean          default(FALSE)
#  required             :boolean          default(TRUE)
#

class PublisherProductToAge < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :required,
                  :age_1,
                  :age_2,
                  :age_3,
                  :age_4,
                  :age_5,
                  :age_6,
                  :age_7,
                  :age_8,
                  :age_9,
                  :age_10,
                  :age_11,
                  :age_12,
                  :age_13,
                  :age_14,
                  :age_15,
                  :age_16,
                  :age_17,
                  :age_18,
                  :age_19,
                  :age_20,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_to_ages")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_to_ages_id_seq RESTART WITH 1")
  end

  
end
