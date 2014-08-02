class CreatePublisherProductEnhancements < ActiveRecord::Migration
  def change
    create_table :publisher_product_enhancements do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "enhancement_1", :default => false
      t.boolean "enhancement_2", :default => false
      t.boolean "enhancement_3", :default => false
      t.boolean "enhancement_4", :default => false
      t.boolean "enhancement_5", :default => false
      t.boolean "enhancement_6", :default => false
      t.boolean "enhancement_7", :default => false
      t.boolean "enhancement_8", :default => false
      t.boolean "enhancement_9", :default => false
      t.boolean "enhancement_10", :default => false

      t.timestamps
    end

    add_index :publisher_product_enhancements, :publisher_id, :name => 'index_enhancement_on_publisher_id'
    add_index :publisher_product_enhancements, :publisher_product_id, :name => 'index_enhancement_on_publisher_product_id'

  end
end
