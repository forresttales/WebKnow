# == Schema Information
#
# Table name: publisher_product_to_grades
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_id         :integer
#  publisher_product_id :integer
#  grade_1              :boolean          default(FALSE)
#  grade_2              :boolean          default(FALSE)
#  grade_3              :boolean          default(FALSE)
#  grade_4              :boolean          default(FALSE)
#  grade_5              :boolean          default(FALSE)
#  grade_6              :boolean          default(FALSE)
#  grade_7              :boolean          default(FALSE)
#  grade_8              :boolean          default(FALSE)
#  grade_9              :boolean          default(FALSE)
#  grade_10             :boolean          default(FALSE)
#  grade_11             :boolean          default(FALSE)
#  grade_12             :boolean          default(FALSE)
#  grade_13             :boolean          default(FALSE)
#  grade_14             :boolean          default(FALSE)
#  grade_15             :boolean          default(FALSE)
#  grade_16             :boolean          default(FALSE)
#  required             :boolean          default(TRUE)
#

class PublisherProductToGrade < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :required,
                  :grade_1,
                  :grade_2,
                  :grade_3,
                  :grade_4,
                  :grade_5,
                  :grade_6,
                  :grade_7,
                  :grade_8,
                  :grade_9,
                  :grade_10,
                  :grade_11,
                  :grade_12,
                  :grade_13,
                  :grade_14,
                  :grade_15,
                  :grade_16,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_to_grades")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_to_grades_id_seq RESTART WITH 1")
  end

  
end
