class CreatePublisherProductLessonTimes < ActiveRecord::Migration
  def change
    create_table :publisher_product_lesson_times do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "lesson_time_1", :default => false
      t.boolean "lesson_time_2", :default => false
      t.boolean "lesson_time_3", :default => false
      t.boolean "lesson_time_4", :default => false
      t.boolean "lesson_time_5", :default => false
      t.boolean "lesson_time_6", :default => false
      t.boolean "lesson_time_7", :default => false
      t.boolean "lesson_time_8", :default => false
      t.boolean "lesson_time_9", :default => false
      t.boolean "lesson_time_10", :default => false
      t.boolean "lesson_time_11", :default => false
      t.boolean "lesson_time_12", :default => false
      t.boolean "lesson_time_13", :default => false
      t.boolean "lesson_time_14", :default => false
      t.boolean "lesson_time_15", :default => false
      t.boolean "lesson_time_16", :default => false
      t.boolean "lesson_time_17", :default => false
      t.boolean "lesson_time_18", :default => false
      t.boolean "lesson_time_19", :default => false
      t.boolean "lesson_time_20", :default => false
      t.boolean "lesson_time_21", :default => false
      t.boolean "lesson_time_22", :default => false
      t.boolean "lesson_time_23", :default => false
      t.boolean "lesson_time_24", :default => false
      t.boolean "lesson_time_25", :default => false
      t.boolean "lesson_time_26", :default => false
      t.boolean "lesson_time_27", :default => false
      t.boolean "lesson_time_28", :default => false
      t.boolean "lesson_time_29", :default => false
      t.boolean "lesson_time_30", :default => false
      t.boolean "lesson_time_31", :default => false
      t.boolean "lesson_time_32", :default => false
      t.boolean "lesson_time_33", :default => false
      t.boolean "lesson_time_34", :default => false
      t.boolean "lesson_time_35", :default => false
      t.boolean "lesson_time_36", :default => false
      t.boolean "lesson_time_37", :default => false
      t.boolean "lesson_time_38", :default => false
      t.boolean "lesson_time_39", :default => false
      t.boolean "lesson_time_40", :default => false
      t.boolean "lesson_time_41", :default => false
      t.boolean "lesson_time_42", :default => false
      t.boolean "lesson_time_43", :default => false
      t.boolean "lesson_time_44", :default => false
      t.boolean "lesson_time_45", :default => false
      t.boolean "lesson_time_46", :default => false
      t.boolean "lesson_time_47", :default => false
      t.boolean "lesson_time_48", :default => false
      t.string  "lesson_time_other"

      t.timestamps
    end
    
    add_index :publisher_product_lesson_times, :publisher_id, :name => 'index_lesson_time_on_publisher_id'
    add_index :publisher_product_lesson_times, :publisher_product_id, :name => 'index_lesson_time_on_publisher_product_id'

  end
end
