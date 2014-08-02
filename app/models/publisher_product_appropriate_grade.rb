# == Schema Information
#
# Table name: publisher_product_appropriate_grades
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  grade_appropriate_1              :boolean          default(FALSE)
#  grade_appropriate_2              :boolean          default(FALSE)
#  grade_appropriate_3              :boolean          default(FALSE)
#  grade_appropriate_4              :boolean          default(FALSE)
#  grade_appropriate_5              :boolean          default(FALSE)
#  grade_appropriate_6              :boolean          default(FALSE)
#  grade_appropriate_7              :boolean          default(FALSE)
#  grade_appropriate_8              :boolean          default(FALSE)
#  grade_appropriate_9              :boolean          default(FALSE)
#  grade_appropriate_10             :boolean          default(FALSE)
#  grade_appropriate_11             :boolean          default(FALSE)
#  grade_appropriate_12             :boolean          default(FALSE)
#  grade_appropriate_13             :boolean          default(FALSE)
#  grade_appropriate_14             :boolean          default(FALSE)
#  grade_appropriate_15             :boolean          default(FALSE)
#  grade_appropriate_16             :boolean          default(FALSE)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductAppropriateGrade < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :grade_appropriate_1,
                  :grade_appropriate_2,
                  :grade_appropriate_3,
                  :grade_appropriate_4,
                  :grade_appropriate_5,
                  :grade_appropriate_6,
                  :grade_appropriate_7,
                  :grade_appropriate_8,
                  :grade_appropriate_9,
                  :grade_appropriate_10,
                  :grade_appropriate_11,
                  :grade_appropriate_12,
                  :grade_appropriate_13,
                  :grade_appropriate_14,
                  :grade_appropriate_15,
                  :grade_appropriate_16,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_appropriate_grades")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_appropriate_grades_id_seq RESTART WITH 1")
  end

  
end
