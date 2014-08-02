# == Schema Information
#
# Table name: publisher_product_platforms
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  platform_1                       :boolean          default(FALSE)
#  platform_2                       :boolean          default(FALSE)
#  platform_3                       :boolean          default(FALSE)
#  platform_4                       :boolean          default(FALSE)
#  platform_5                       :boolean          default(FALSE)
#  platform_6                       :boolean          default(FALSE)
#  platform_7                       :boolean          default(FALSE)
#  platform_8                       :boolean          default(FALSE)
#  platform_9                       :boolean          default(FALSE)
#  platform_10                      :boolean          default(FALSE)
#  platform_11                      :boolean          default(FALSE)
#  platform_12                      :boolean          default(FALSE)
#  platform_13                      :boolean          default(FALSE)
#  platform_14                      :boolean          default(FALSE)
#  platform_15                      :boolean          default(FALSE)
#  platform_16                      :boolean          default(FALSE)
#  platform_17                      :boolean          default(FALSE)
#  platform_18                      :boolean          default(FALSE)
#  platform_19                      :boolean          default(FALSE)
#  platform_20                      :boolean          default(FALSE)
#  platform_21                      :boolean          default(FALSE)
#  platform_22                      :boolean          default(FALSE)
#  platform_23                      :boolean          default(FALSE)
#  platform_24                      :boolean          default(FALSE)
#  platform_25                      :boolean          default(FALSE)
#  platform_26                      :boolean          default(FALSE)
#  platform_27                      :boolean          default(FALSE)
#  platform_28                      :boolean          default(FALSE)
#  platform_29                      :boolean          default(FALSE)
#  platform_30                      :boolean          default(FALSE)
#  platform_31                      :boolean          default(FALSE)
#  platform_32                      :boolean          default(FALSE)
#  platform_33                      :boolean          default(FALSE)
#  platform_34                      :boolean          default(FALSE)
#  platform_35                      :boolean          default(FALSE)
#  platform_36                      :boolean          default(FALSE)
#  platform_37                      :boolean          default(FALSE)
#  platform_38                      :boolean          default(FALSE)
#  platform_39                      :boolean          default(FALSE)
#  platform_40                      :boolean          default(FALSE)
#  platform_41                      :boolean          default(FALSE)
#  platform_42                      :boolean          default(FALSE)
#  platform_43                      :boolean          default(FALSE)
#  platform_44                      :boolean          default(FALSE)
#  platform_45                      :boolean          default(FALSE)
#  platform_46                      :boolean          default(FALSE)
#  platform_47                      :boolean          default(FALSE)
#  platform_48                      :boolean          default(FALSE)
#  platform_49                      :boolean          default(FALSE)
#  platform_50                      :boolean          default(FALSE)
#  platform_other                   :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#

class PublisherProductPlatform < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :platform_1,
                  :platform_2,
                  :platform_3,
                  :platform_4,
                  :platform_5,
                  :platform_6,
                  :platform_7,
                  :platform_8,
                  :platform_9,
                  :platform_10,
                  :platform_11,
                  :platform_12,
                  :platform_13,
                  :platform_14,
                  :platform_15,
                  :platform_16,
                  :platform_17,
                  :platform_18,
                  :platform_19,
                  :platform_20,
                  :platform_21,
                  :platform_22,
                  :platform_23,
                  :platform_24,
                  :platform_25,
                  :platform_26,
                  :platform_27,
                  :platform_28,
                  :platform_29,
                  :platform_30,
                  :platform_31,
                  :platform_32,
                  :platform_33,
                  :platform_34,
                  :platform_35,
                  :platform_36,
                  :platform_37,
                  :platform_38,
                  :platform_39,
                  :platform_40,
                  :platform_41,
                  :platform_42,
                  :platform_43,
                  :platform_44,
                  :platform_45,
                  :platform_46,
                  :platform_47,
                  :platform_48,
                  :platform_49,
                  :platform_50,
                  :platform_other,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_platforms")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_platforms_id_seq RESTART WITH 1")
  end

  
end
