class AlterPublisherAdListings1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_ad_listings, :user_id, :integer, :default => 0
      add_column :publisher_ad_listings, :publisher_id, :integer, :default => 0
      add_column :publisher_ad_listings, :publisher_product_id, :integer, :default => 0
      
      add_column :publisher_ad_listings, :ad_amount, :decimal, precision: 8, scale: 2, :default => 0.00

      add_column :publisher_ad_listings, :name_product, :string
      
      add_column :publisher_ad_listings, :term_listing, :integer, :default => 0
      add_column :publisher_ad_listings, :term_positioning, :integer, :default => 0
      add_column :publisher_ad_listings, :term_keyword, :integer, :default => 0

      add_column :publisher_ad_listings, :keyword, :string

      add_column :publisher_ad_listings, :cost_listing, :decimal, precision: 8, scale: 2, :default => 0.00
      add_column :publisher_ad_listings, :cost_positioning, :decimal, precision: 8, scale: 2, :default => 0.00
      add_column :publisher_ad_listings, :cost_keyword, :decimal, precision: 8, scale: 2, :default => 0.00

      add_column :publisher_ad_listings, :ad_date_exp, :datetime
      add_column :publisher_ad_listings, :ad_date_init, :datetime

      add_index("publisher_ad_listings", "publisher_id")
    
  end
end
