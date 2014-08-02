# == Schema Information
#
# Table name: publisher_product_content_types
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  content_type_1                   :boolean          default(FALSE)
#  content_type_2                   :boolean          default(FALSE)
#  content_type_3                   :boolean          default(FALSE)
#  content_type_4                   :boolean          default(FALSE)
#  content_type_5                   :boolean          default(FALSE)
#  content_type_6                   :boolean          default(FALSE)
#  content_type_7                   :boolean          default(FALSE)
#  content_type_8                   :boolean          default(FALSE)
#  content_type_9                   :boolean          default(FALSE)
#  content_type_10                  :boolean          default(FALSE)
#  content_type_11                  :boolean          default(FALSE)
#  content_type_12                  :boolean          default(FALSE)
#  content_type_13                  :boolean          default(FALSE)
#  content_type_14                  :boolean          default(FALSE)
#  content_type_15                  :boolean          default(FALSE)
#  content_type_16                  :boolean          default(FALSE)
#  content_type_17                  :boolean          default(FALSE)
#  content_type_18                  :boolean          default(FALSE)
#  content_type_19                  :boolean          default(FALSE)
#  content_type_20                  :boolean          default(FALSE)
#  content_type_other               :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductContentType < ActiveRecord::Base

  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :content_type_1,
                  :content_type_2,
                  :content_type_3,
                  :content_type_4,
                  :content_type_5,
                  :content_type_6,
                  :content_type_7,
                  :content_type_8,
                  :content_type_9,
                  :content_type_10,
                  :content_type_11,
                  :content_type_12,
                  :content_type_13,
                  :content_type_14,
                  :content_type_15,
                  :content_type_16,
                  :content_type_17,
                  :content_type_18,
                  :content_type_19,
                  :content_type_20,
                  :content_type_other,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_content_types")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_content_types_id_seq RESTART WITH 1")
  end


end
