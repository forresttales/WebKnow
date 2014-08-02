class CreatePublisherProductPricingModels < ActiveRecord::Migration
  def change
    create_table :publisher_product_pricing_models do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "pricing_model_1", :default => false
      t.boolean "pricing_model_2", :default => false
      t.boolean "pricing_model_3", :default => false
      t.boolean "pricing_model_4", :default => false
      t.boolean "pricing_model_5", :default => false

      t.timestamps
    end

    add_index :publisher_product_pricing_models, :publisher_id, :name => 'index_pricing_model_on_publisher_id'
    add_index :publisher_product_pricing_models, :publisher_product_id, :name => 'index_pricing_model_on_publisher_product_id'

  end
end
