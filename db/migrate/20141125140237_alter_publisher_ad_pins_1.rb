class AlterPublisherAdPins1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_ad_pins, :user_id, :integer, :default => 0
      add_column :publisher_ad_pins, :publisher_id, :integer, :default => 0
      add_column :publisher_ad_pins, :publisher_product_id, :integer, :default => 0
      
      add_column :publisher_ad_pins, :ad_amount, :decimal, precision: 8, scale: 2, :default => 0.00

      add_column :publisher_ad_pins, :name_product, :string

      add_column :publisher_ad_pins, :poster, :string
      add_column :publisher_ad_pins, :poster_index, :integer, :default => 0

      add_column :publisher_ad_pins, :category, :string
      add_column :publisher_ad_pins, :category_index, :integer, :default => 0
      
      add_column :publisher_ad_pins, :term_pin, :integer, :default => 0

      add_column :publisher_ad_pins, :ad_date_exp, :datetime
      add_column :publisher_ad_pins, :ad_date_init, :datetime

      add_index("publisher_ad_pins", "publisher_id")

    
  end
end
