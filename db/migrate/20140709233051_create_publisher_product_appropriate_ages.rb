class CreatePublisherProductAppropriateAges < ActiveRecord::Migration
  def change
    create_table :publisher_product_appropriate_ages do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "age_appropriate_1", :default => false
      t.boolean "age_appropriate_2", :default => false
      t.boolean "age_appropriate_3", :default => false
      t.boolean "age_appropriate_4", :default => false
      t.boolean "age_appropriate_5", :default => false
      t.boolean "age_appropriate_6", :default => false
      t.boolean "age_appropriate_7", :default => false
      t.boolean "age_appropriate_8", :default => false
      t.boolean "age_appropriate_9", :default => false
      t.boolean "age_appropriate_10", :default => false
      t.boolean "age_appropriate_11", :default => false
      t.boolean "age_appropriate_12", :default => false
      t.boolean "age_appropriate_13", :default => false
      t.boolean "age_appropriate_14", :default => false
      t.boolean "age_appropriate_15", :default => false
      t.boolean "age_appropriate_16", :default => false
      t.boolean "age_appropriate_17", :default => false
      t.boolean "age_appropriate_adult", :default => false

      t.timestamps
    end
    
    add_index :publisher_product_appropriate_ages, :publisher_id, :name => 'index_appr_age_on_publisher_id'
    add_index :publisher_product_appropriate_ages, :publisher_product_id, :name => 'index_appr_age_on_publisher_product_id'
    add_index :publisher_product_appropriate_ages, :publisher_product_description_id, :name => 'index_appr_age_on_publisher_product_description_id'
    
  end
end
