class CreatePublisherProductCoreMathStandards < ActiveRecord::Migration
  def change
    create_table :publisher_product_core_math_standards do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.string "dot_not"
      t.string "uri"      

      t.timestamps
    end
    
    add_index :publisher_product_core_math_standards, :publisher_id, :name => 'index_cms_on_publisher_id'
    add_index :publisher_product_core_math_standards, :publisher_product_id, :name => 'index_cms_on_publisher_product_id'
    
  end
end
