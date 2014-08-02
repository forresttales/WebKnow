class CreatePublisherProductCategorySubjects < ActiveRecord::Migration
  def change
    create_table :publisher_product_category_subjects do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "category_subject_1", :default => false
      t.boolean "category_subject_2", :default => false
      t.boolean "category_subject_3", :default => false
      t.boolean "category_subject_4", :default => false
      t.boolean "category_subject_5", :default => false
      t.boolean "category_subject_6", :default => false
      t.boolean "category_subject_7", :default => false
      t.boolean "category_subject_8", :default => false
      t.boolean "category_subject_9", :default => false
      t.boolean "category_subject_10", :default => false
      t.boolean "category_subject_11", :default => false
      t.boolean "category_subject_12", :default => false
      t.boolean "category_subject_13", :default => false
      t.boolean "category_subject_14", :default => false
      t.boolean "category_subject_15", :default => false
      t.boolean "category_subject_16", :default => false
      t.boolean "category_subject_17", :default => false
      t.boolean "category_subject_18", :default => false
      t.boolean "category_subject_19", :default => false
      t.boolean "category_subject_20", :default => false
      t.boolean "category_subject_21", :default => false
      t.boolean "category_subject_22", :default => false
      t.boolean "category_subject_23", :default => false
      t.boolean "category_subject_24", :default => false
      t.boolean "category_subject_25", :default => false
      t.boolean "category_subject_26", :default => false
      t.boolean "category_subject_27", :default => false
      t.boolean "category_subject_28", :default => false
      t.boolean "category_subject_29", :default => false
      t.boolean "category_subject_30", :default => false
      t.boolean "category_subject_31", :default => false
      t.boolean "category_subject_32", :default => false
      t.boolean "category_subject_33", :default => false
      t.boolean "category_subject_34", :default => false
      t.boolean "category_subject_35", :default => false
      t.boolean "category_subject_36", :default => false
      t.boolean "category_subject_37", :default => false
      t.boolean "category_subject_38", :default => false
      t.boolean "category_subject_39", :default => false
      t.boolean "category_subject_40", :default => false
      t.boolean "category_subject_41", :default => false
      t.boolean "category_subject_42", :default => false
      t.boolean "category_subject_43", :default => false
      t.boolean "category_subject_44", :default => false
      t.boolean "category_subject_45", :default => false
      t.boolean "category_subject_46", :default => false
      t.boolean "category_subject_47", :default => false
      t.boolean "category_subject_48", :default => false
      t.boolean "category_subject_49", :default => false
      t.boolean "category_subject_50", :default => false
      t.boolean "category_subject_51", :default => false
      t.boolean "category_subject_52", :default => false
      t.boolean "category_subject_53", :default => false
      t.boolean "category_subject_54", :default => false
      t.boolean "category_subject_55", :default => false
      t.boolean "category_subject_56", :default => false
      t.boolean "category_subject_57", :default => false
      t.boolean "category_subject_58", :default => false
      t.boolean "category_subject_59", :default => false
      t.boolean "category_subject_60", :default => false
      t.boolean "category_subject_61", :default => false
      t.boolean "category_subject_62", :default => false
      t.boolean "category_subject_63", :default => false
      t.boolean "category_subject_64", :default => false
      t.boolean "category_subject_65", :default => false
      t.boolean "category_subject_66", :default => false
      t.boolean "category_subject_67", :default => false
      t.boolean "category_subject_68", :default => false
      t.boolean "category_subject_69", :default => false
      t.boolean "category_subject_70", :default => false
      t.string  "category_subject_other"

      t.timestamps
    end
    
    add_index :publisher_product_category_subjects, :publisher_id, :name => 'index_category_subject_on_publisher_id'
    add_index :publisher_product_category_subjects, :publisher_product_id, :name => 'index_category_subject_on_publisher_product_id'

  end
end
