# == Schema Information
#
# Table name: publisher_product_category_subjects
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  category_subject_1               :boolean          default(FALSE)
#  category_subject_2               :boolean          default(FALSE)
#  category_subject_3               :boolean          default(FALSE)
#  category_subject_4               :boolean          default(FALSE)
#  category_subject_5               :boolean          default(FALSE)
#  category_subject_6               :boolean          default(FALSE)
#  category_subject_7               :boolean          default(FALSE)
#  category_subject_8               :boolean          default(FALSE)
#  category_subject_9               :boolean          default(FALSE)
#  category_subject_10              :boolean          default(FALSE)
#  category_subject_11              :boolean          default(FALSE)
#  category_subject_12              :boolean          default(FALSE)
#  category_subject_13              :boolean          default(FALSE)
#  category_subject_14              :boolean          default(FALSE)
#  category_subject_15              :boolean          default(FALSE)
#  category_subject_16              :boolean          default(FALSE)
#  category_subject_17              :boolean          default(FALSE)
#  category_subject_18              :boolean          default(FALSE)
#  category_subject_19              :boolean          default(FALSE)
#  category_subject_20              :boolean          default(FALSE)
#  category_subject_21              :boolean          default(FALSE)
#  category_subject_22              :boolean          default(FALSE)
#  category_subject_23              :boolean          default(FALSE)
#  category_subject_24              :boolean          default(FALSE)
#  category_subject_25              :boolean          default(FALSE)
#  category_subject_26              :boolean          default(FALSE)
#  category_subject_27              :boolean          default(FALSE)
#  category_subject_28              :boolean          default(FALSE)
#  category_subject_29              :boolean          default(FALSE)
#  category_subject_30              :boolean          default(FALSE)
#  category_subject_31              :boolean          default(FALSE)
#  category_subject_32              :boolean          default(FALSE)
#  category_subject_33              :boolean          default(FALSE)
#  category_subject_34              :boolean          default(FALSE)
#  category_subject_35              :boolean          default(FALSE)
#  category_subject_36              :boolean          default(FALSE)
#  category_subject_37              :boolean          default(FALSE)
#  category_subject_38              :boolean          default(FALSE)
#  category_subject_39              :boolean          default(FALSE)
#  category_subject_40              :boolean          default(FALSE)
#  category_subject_41              :boolean          default(FALSE)
#  category_subject_42              :boolean          default(FALSE)
#  category_subject_43              :boolean          default(FALSE)
#  category_subject_44              :boolean          default(FALSE)
#  category_subject_45              :boolean          default(FALSE)
#  category_subject_46              :boolean          default(FALSE)
#  category_subject_47              :boolean          default(FALSE)
#  category_subject_48              :boolean          default(FALSE)
#  category_subject_49              :boolean          default(FALSE)
#  category_subject_50              :boolean          default(FALSE)
#  category_subject_51              :boolean          default(FALSE)
#  category_subject_52              :boolean          default(FALSE)
#  category_subject_53              :boolean          default(FALSE)
#  category_subject_54              :boolean          default(FALSE)
#  category_subject_55              :boolean          default(FALSE)
#  category_subject_56              :boolean          default(FALSE)
#  category_subject_57              :boolean          default(FALSE)
#  category_subject_58              :boolean          default(FALSE)
#  category_subject_59              :boolean          default(FALSE)
#  category_subject_60              :boolean          default(FALSE)
#  category_subject_61              :boolean          default(FALSE)
#  category_subject_62              :boolean          default(FALSE)
#  category_subject_63              :boolean          default(FALSE)
#  category_subject_64              :boolean          default(FALSE)
#  category_subject_65              :boolean          default(FALSE)
#  category_subject_66              :boolean          default(FALSE)
#  category_subject_67              :boolean          default(FALSE)
#  category_subject_68              :boolean          default(FALSE)
#  category_subject_69              :boolean          default(FALSE)
#  category_subject_70              :boolean          default(FALSE)
#  category_subject_other           :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  category_subject_other_b         :boolean          default(FALSE)
#

class PublisherProductCategorySubject < ActiveRecord::Base

  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :category_subject_1,
                  :category_subject_2,
                  :category_subject_3,
                  :category_subject_4,
                  :category_subject_5,
                  :category_subject_6,
                  :category_subject_7,
                  :category_subject_8,
                  :category_subject_9,
                  :category_subject_10,
                  :category_subject_11,
                  :category_subject_12,
                  :category_subject_13,
                  :category_subject_14,
                  :category_subject_15,
                  :category_subject_16,
                  :category_subject_17,
                  :category_subject_18,
                  :category_subject_19,
                  :category_subject_20,
                  :category_subject_21,
                  :category_subject_22,
                  :category_subject_23,
                  :category_subject_24,
                  :category_subject_25,
                  :category_subject_26,
                  :category_subject_27,
                  :category_subject_28,
                  :category_subject_29,
                  :category_subject_30,
                  :category_subject_31,
                  :category_subject_32,
                  :category_subject_33,
                  :category_subject_34,
                  :category_subject_35,
                  :category_subject_36,
                  :category_subject_37,
                  :category_subject_38,
                  :category_subject_39,
                  :category_subject_40,
                  :category_subject_41,
                  :category_subject_42,
                  :category_subject_43,
                  :category_subject_44,
                  :category_subject_45,
                  :category_subject_46,
                  :category_subject_47,
                  :category_subject_48,
                  :category_subject_49,
                  :category_subject_50,
                  :category_subject_51,
                  :category_subject_52,
                  :category_subject_53,
                  :category_subject_54,
                  :category_subject_55,
                  :category_subject_56,
                  :category_subject_57,
                  :category_subject_58,
                  :category_subject_59,
                  :category_subject_60,
                  :category_subject_61,
                  :category_subject_62,
                  :category_subject_63,
                  :category_subject_64,
                  :category_subject_65,
                  :category_subject_66,
                  :category_subject_67,
                  :category_subject_68,
                  :category_subject_69,
                  :category_subject_70,
                  :category_subject_other,
                  :category_subject_other_b,
                  :created_at,
                  :updated_at

  
  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_category_subjects")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_category_subjects_id_seq RESTART WITH 1")
  end

  
end
