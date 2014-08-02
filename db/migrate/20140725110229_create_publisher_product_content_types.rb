class CreatePublisherProductContentTypes < ActiveRecord::Migration
  def change
    create_table :publisher_product_content_types do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "content_type_1", :default => false
      t.boolean "content_type_2", :default => false
      t.boolean "content_type_3", :default => false
      t.boolean "content_type_4", :default => false
      t.boolean "content_type_5", :default => false
      t.boolean "content_type_6", :default => false
      t.boolean "content_type_7", :default => false
      t.boolean "content_type_8", :default => false
      t.boolean "content_type_9", :default => false
      t.boolean "content_type_10", :default => false
      t.boolean "content_type_11", :default => false
      t.boolean "content_type_12", :default => false
      t.boolean "content_type_13", :default => false
      t.boolean "content_type_14", :default => false
      t.boolean "content_type_15", :default => false
      t.boolean "content_type_16", :default => false
      t.boolean "content_type_17", :default => false
      t.boolean "content_type_18", :default => false
      t.boolean "content_type_19", :default => false
      t.boolean "content_type_20", :default => false
      t.string  "content_type_other"

      t.timestamps
    end
    
    add_index :publisher_product_content_types, :publisher_id, :name => 'index_content_type_on_publisher_id'
    add_index :publisher_product_content_types, :publisher_product_id, :name => 'index_content_type_on_publisher_product_id'

  end
end
