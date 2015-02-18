class AlterPublisherAds1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_ads, :ad_index, :integer, :default => 0
      add_column :publisher_ads, :ad_description, :string
      add_column :publisher_ads, :ad_status_purchased, :boolean, :default => false
      add_column :publisher_ads, :ad_status_public, :boolean, :default => false
      add_column :publisher_ads, :ad_date_exp, :datetime
      add_column :publisher_ads, :ad_date_init, :datetime
    
  end
end
