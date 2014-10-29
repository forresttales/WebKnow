class CreatePublisherProductByReviews < ActiveRecord::Migration
  def change
    create_table :publisher_product_by_reviews do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      
      t.boolean "by_review_1", :default => false
      t.string  "by_review_1_text"
            
      t.boolean "by_review_2", :default => false
      t.string  "by_review_2_text"      

      t.boolean "by_review_3", :default => false
      t.string  "by_review_3_text"      

      t.boolean "by_review_4", :default => false
      t.string  "by_review_4_text"      

      t.boolean "by_review_5", :default => false
      t.string  "by_review_5_text"      

      t.boolean "by_review_6", :default => false
      t.string  "by_review_6_text"      

      t.boolean "by_review_7", :default => false
      t.string  "by_review_7_text"      

      t.boolean "by_review_8", :default => false
      t.string  "by_review_8_text"      

      t.boolean "by_review_9", :default => false
      t.string  "by_review_9_text"      

      t.boolean "by_review_10", :default => false
      t.string  "by_review_10_text"      

      t.boolean "by_review_11", :default => false
      t.string  "by_review_11_text"      

      t.boolean "by_review_12", :default => false
      t.string  "by_review_12_text"      

      t.boolean "by_review_13", :default => false
      t.string  "by_review_13_text"      

      t.boolean "by_review_14", :default => false
      t.string  "by_review_14_text"      

      t.boolean "by_review_15", :default => false
      t.string  "by_review_15_text"      

      t.boolean "by_review_16", :default => false
      t.string  "by_review_16_text"      

      t.boolean "by_review_17", :default => false
      t.string  "by_review_17_text"      

      t.boolean "by_review_18", :default => false
      t.string  "by_review_18_text"      

      t.boolean "by_review_19", :default => false
      t.string  "by_review_19_text"      

      t.boolean "by_review_20", :default => false
      t.string  "by_review_20_text"      

      t.string  "by_review_other"
      t.string  "by_review_other_text"

      t.timestamps
    end
    
    add_index :publisher_product_by_reviews, :publisher_id, :name => 'index_by_review_on_publisher_id'
    add_index :publisher_product_by_reviews, :publisher_product_id, :name => 'index_by_review_on_publisher_product_id'

  end
end
