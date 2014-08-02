class CreatePublisherProductFileTypes < ActiveRecord::Migration
  def change
    create_table :publisher_product_file_types do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "file_type_1", :default => false
      t.boolean "file_type_2", :default => false
      t.boolean "file_type_3", :default => false
      t.boolean "file_type_4", :default => false
      t.boolean "file_type_5", :default => false
      t.boolean "file_type_6", :default => false
      t.boolean "file_type_7", :default => false
      t.boolean "file_type_8", :default => false
      t.boolean "file_type_9", :default => false
      t.boolean "file_type_10", :default => false
      t.boolean "file_type_11", :default => false
      t.boolean "file_type_12", :default => false
      t.boolean "file_type_13", :default => false
      t.boolean "file_type_14", :default => false
      t.boolean "file_type_15", :default => false
      t.boolean "file_type_16", :default => false
      t.boolean "file_type_17", :default => false
      t.boolean "file_type_18", :default => false
      t.boolean "file_type_19", :default => false
      t.boolean "file_type_20", :default => false
      t.boolean "file_type_21", :default => false
      t.boolean "file_type_22", :default => false
      t.boolean "file_type_23", :default => false
      t.boolean "file_type_24", :default => false
      t.boolean "file_type_25", :default => false
      t.boolean "file_type_26", :default => false
      t.boolean "file_type_27", :default => false
      t.boolean "file_type_28", :default => false
      t.boolean "file_type_29", :default => false
      t.boolean "file_type_30", :default => false
      t.string  "file_type_other"

      t.timestamps
    end
    
    add_index :publisher_product_file_types, :publisher_id, :name => 'index_file_type_on_publisher_id'
    add_index :publisher_product_file_types, :publisher_product_id, :name => 'index_file_type_on_publisher_product_id'

  end
end
