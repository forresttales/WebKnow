class AlterPublisherAds4 < ActiveRecord::Migration
  def change
    
      add_column :publisher_ads, :publisher_product_id, :integer, :default => 0
    
  end
end
