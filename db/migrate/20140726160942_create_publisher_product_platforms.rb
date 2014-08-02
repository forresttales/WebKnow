class CreatePublisherProductPlatforms < ActiveRecord::Migration
  def change
    create_table :publisher_product_platforms do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "platform_1", :default => false
      t.boolean "platform_2", :default => false
      t.boolean "platform_3", :default => false
      t.boolean "platform_4", :default => false
      t.boolean "platform_5", :default => false
      t.boolean "platform_6", :default => false
      t.boolean "platform_7", :default => false
      t.boolean "platform_8", :default => false
      t.boolean "platform_9", :default => false
      t.boolean "platform_10", :default => false
      t.boolean "platform_11", :default => false
      t.boolean "platform_12", :default => false
      t.boolean "platform_13", :default => false
      t.boolean "platform_14", :default => false
      t.boolean "platform_15", :default => false
      t.boolean "platform_16", :default => false
      t.boolean "platform_17", :default => false
      t.boolean "platform_18", :default => false
      t.boolean "platform_19", :default => false
      t.boolean "platform_20", :default => false
      t.boolean "platform_21", :default => false
      t.boolean "platform_22", :default => false
      t.boolean "platform_23", :default => false
      t.boolean "platform_24", :default => false
      t.boolean "platform_25", :default => false
      t.boolean "platform_26", :default => false
      t.boolean "platform_27", :default => false
      t.boolean "platform_28", :default => false
      t.boolean "platform_29", :default => false
      t.boolean "platform_30", :default => false
      t.boolean "platform_31", :default => false
      t.boolean "platform_32", :default => false
      t.boolean "platform_33", :default => false
      t.boolean "platform_34", :default => false
      t.boolean "platform_35", :default => false
      t.boolean "platform_36", :default => false
      t.boolean "platform_37", :default => false
      t.boolean "platform_38", :default => false
      t.boolean "platform_39", :default => false
      t.boolean "platform_40", :default => false
      t.boolean "platform_41", :default => false
      t.boolean "platform_42", :default => false
      t.boolean "platform_43", :default => false
      t.boolean "platform_44", :default => false
      t.boolean "platform_45", :default => false
      t.boolean "platform_46", :default => false
      t.boolean "platform_47", :default => false
      t.boolean "platform_48", :default => false
      t.boolean "platform_49", :default => false
      t.boolean "platform_50", :default => false
      t.string  "platform_other"

      t.timestamps
    end
    
    add_index :publisher_product_platforms, :publisher_id, :name => 'index_platform_on_publisher_id'
    add_index :publisher_product_platforms, :publisher_product_id, :name => 'index_platform_on_publisher_product_id'

  end
end
