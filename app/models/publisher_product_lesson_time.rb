# == Schema Information
#
# Table name: publisher_product_lesson_times
#
#  id                          :integer          not null, primary key
#  publisher_id                :integer
#  publisher_product_id        :integer
#  lesson_time_1               :boolean          default(FALSE)
#  lesson_time_2               :boolean          default(FALSE)
#  lesson_time_3               :boolean          default(FALSE)
#  lesson_time_4               :boolean          default(FALSE)
#  lesson_time_5               :boolean          default(FALSE)
#  lesson_time_6               :boolean          default(FALSE)
#  lesson_time_7               :boolean          default(FALSE)
#  lesson_time_8               :boolean          default(FALSE)
#  lesson_time_9               :boolean          default(FALSE)
#  lesson_time_10              :boolean          default(FALSE)
#  lesson_time_11              :boolean          default(FALSE)
#  lesson_time_12              :boolean          default(FALSE)
#  lesson_time_13              :boolean          default(FALSE)
#  lesson_time_14              :boolean          default(FALSE)
#  lesson_time_15              :boolean          default(FALSE)
#  lesson_time_16              :boolean          default(FALSE)
#  lesson_time_17              :boolean          default(FALSE)
#  lesson_time_18              :boolean          default(FALSE)
#  lesson_time_19              :boolean          default(FALSE)
#  lesson_time_20              :boolean          default(FALSE)
#  lesson_time_21              :boolean          default(FALSE)
#  lesson_time_22              :boolean          default(FALSE)
#  lesson_time_23              :boolean          default(FALSE)
#  lesson_time_24              :boolean          default(FALSE)
#  lesson_time_25              :boolean          default(FALSE)
#  lesson_time_26              :boolean          default(FALSE)
#  lesson_time_27              :boolean          default(FALSE)
#  lesson_time_28              :boolean          default(FALSE)
#  lesson_time_29              :boolean          default(FALSE)
#  lesson_time_30              :boolean          default(FALSE)
#  lesson_time_31              :boolean          default(FALSE)
#  lesson_time_32              :boolean          default(FALSE)
#  lesson_time_33              :boolean          default(FALSE)
#  lesson_time_34              :boolean          default(FALSE)
#  lesson_time_35              :boolean          default(FALSE)
#  lesson_time_36              :boolean          default(FALSE)
#  lesson_time_37              :boolean          default(FALSE)
#  lesson_time_38              :boolean          default(FALSE)
#  lesson_time_39              :boolean          default(FALSE)
#  lesson_time_40              :boolean          default(FALSE)
#  lesson_time_41              :boolean          default(FALSE)
#  lesson_time_42              :boolean          default(FALSE)
#  lesson_time_43              :boolean          default(FALSE)
#  lesson_time_44              :boolean          default(FALSE)
#  lesson_time_45              :boolean          default(FALSE)
#  lesson_time_46              :boolean          default(FALSE)
#  lesson_time_47              :boolean          default(FALSE)
#  lesson_time_48              :boolean          default(FALSE)
#  lesson_time_other           :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#  lesson_time_pertinent_index :integer          default(0)
#  lesson_time_pertinent       :string(255)
#

class PublisherProductLessonTime < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :lesson_time_1,
                  :lesson_time_2,
                  :lesson_time_3,
                  :lesson_time_4,
                  :lesson_time_5,
                  :lesson_time_6,
                  :lesson_time_7,
                  :lesson_time_8,
                  :lesson_time_9,
                  :lesson_time_10,
                  :lesson_time_11,
                  :lesson_time_12,
                  :lesson_time_13,
                  :lesson_time_14,
                  :lesson_time_15,
                  :lesson_time_16,
                  :lesson_time_17,
                  :lesson_time_18,
                  :lesson_time_19,
                  :lesson_time_20,
                  :lesson_time_21,
                  :lesson_time_22,
                  :lesson_time_23,
                  :lesson_time_24,
                  :lesson_time_25,
                  :lesson_time_26,
                  :lesson_time_27,
                  :lesson_time_28,
                  :lesson_time_29,
                  :lesson_time_30,
                  :lesson_time_31,
                  :lesson_time_32,
                  :lesson_time_33,
                  :lesson_time_34,
                  :lesson_time_35,
                  :lesson_time_36,
                  :lesson_time_37,
                  :lesson_time_38,
                  :lesson_time_39,
                  :lesson_time_40,
                  :lesson_time_41,
                  :lesson_time_42,
                  :lesson_time_43,
                  :lesson_time_44,
                  :lesson_time_45,
                  :lesson_time_46,
                  :lesson_time_47,
                  :lesson_time_48,
                  :lesson_time_pertinent_index,
                  :lesson_time_pertinent,
                  :lesson_time_other,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_lesson_times")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_lesson_times_id_seq RESTART WITH 1")
  end

  
end
