# == Schema Information
#
# Table name: publisher_product_grade_ranges
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_id         :integer
#  publisher_product_id :integer
#  grade_from           :integer          default(0)
#  grade_to             :integer          default(0)
#  required             :boolean          default(FALSE)
#

class PublisherProductGradeRange < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :required,
                  :grade_from,
                  :grade_to




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_grade_ranges")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_grade_ranges_id_seq RESTART WITH 1")
  end

  
end
