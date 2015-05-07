# == Schema Information
#
# Table name: publisher_product_subjects
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_product_id :integer
#  publisher_id         :integer
#  subject_text         :text             default("")
#

class PublisherProductSubject < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :subject_text,   
                  :created_at,
                  :updated_at 


                  
  
  belongs_to :publisher_product

  # config.active_record.default_timezone = :local
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_subjects")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_subjects_id_seq RESTART WITH 1")
  end

  
end
