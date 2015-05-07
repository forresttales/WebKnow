# == Schema Information
#
# Table name: publisher_product_file_types
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  file_type_1          :boolean          default(FALSE)
#  file_type_2          :boolean          default(FALSE)
#  file_type_3          :boolean          default(FALSE)
#  file_type_4          :boolean          default(FALSE)
#  file_type_5          :boolean          default(FALSE)
#  file_type_6          :boolean          default(FALSE)
#  file_type_7          :boolean          default(FALSE)
#  file_type_8          :boolean          default(FALSE)
#  file_type_9          :boolean          default(FALSE)
#  file_type_10         :boolean          default(FALSE)
#  file_type_11         :boolean          default(FALSE)
#  file_type_12         :boolean          default(FALSE)
#  file_type_13         :boolean          default(FALSE)
#  file_type_14         :boolean          default(FALSE)
#  file_type_15         :boolean          default(FALSE)
#  file_type_16         :boolean          default(FALSE)
#  file_type_17         :boolean          default(FALSE)
#  file_type_18         :boolean          default(FALSE)
#  file_type_19         :boolean          default(FALSE)
#  file_type_20         :boolean          default(FALSE)
#  file_type_21         :boolean          default(FALSE)
#  file_type_22         :boolean          default(FALSE)
#  file_type_23         :boolean          default(FALSE)
#  file_type_24         :boolean          default(FALSE)
#  file_type_25         :boolean          default(FALSE)
#  file_type_26         :boolean          default(FALSE)
#  file_type_27         :boolean          default(FALSE)
#  file_type_28         :boolean          default(FALSE)
#  file_type_29         :boolean          default(FALSE)
#  file_type_30         :boolean          default(FALSE)
#  file_type_other      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  file_type_other_b    :boolean          default(FALSE)
#

class PublisherProductFileType < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :file_type_1,
                  :file_type_2,
                  :file_type_3,
                  :file_type_4,
                  :file_type_5,
                  :file_type_6,
                  :file_type_7,
                  :file_type_8,
                  :file_type_9,
                  :file_type_10,
                  :file_type_11,
                  :file_type_12,
                  :file_type_13,
                  :file_type_14,
                  :file_type_15,
                  :file_type_16,
                  :file_type_17,
                  :file_type_18,
                  :file_type_19,
                  :file_type_20,
                  :file_type_21,
                  :file_type_22,
                  :file_type_23,
                  :file_type_24,
                  :file_type_25,
                  :file_type_26,
                  :file_type_27,
                  :file_type_28,
                  :file_type_29,
                  :file_type_30,
                  :file_type_other,
                  :file_type_other_b,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_file_types")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_file_types_id_seq RESTART WITH 1")
  end

  
end
