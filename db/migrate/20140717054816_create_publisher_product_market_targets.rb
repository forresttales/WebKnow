class CreatePublisherProductMarketTargets < ActiveRecord::Migration
  def change
    create_table :publisher_product_market_targets do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "market_target_1", :default => false
      t.boolean "market_target_2", :default => false

      t.timestamps
    end
    
    add_index :publisher_product_market_targets, :publisher_id, :name => 'index_mark_targ_on_publisher_id'
    add_index :publisher_product_market_targets, :publisher_product_id, :name => 'index_mark_targ_on_publisher_product_id'
    
  end
end
