class CreatePublisherProductPrices < ActiveRecord::Migration
  def change
    create_table :publisher_product_prices do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "price_1", :default => false
      t.decimal "price_1_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_2", :default => false
      t.decimal "price_2_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_3", :default => false
      t.decimal "price_3_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_4", :default => false
      t.decimal "price_4_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_5", :default => false
      t.decimal "price_5_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_6", :default => false
      t.decimal "price_6_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_7", :default => false
      t.decimal "price_7_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_8", :default => false
      t.decimal "price_8_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_9", :default => false
      t.decimal "price_9_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_10", :default => false
      t.decimal "price_10_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_11", :default => false
      t.decimal "price_11_dec", :precision => 8, :scale => 2, :default => 0
      t.boolean "price_12", :default => false
      t.decimal "price_12_dec", :precision => 8, :scale => 2, :default => 0

      t.timestamps
    end

    add_index :publisher_product_prices, :publisher_id, :name => 'index_price_on_publisher_id'
    add_index :publisher_product_prices, :publisher_product_id, :name => 'index_price_on_publisher_product_id'

  end
end
