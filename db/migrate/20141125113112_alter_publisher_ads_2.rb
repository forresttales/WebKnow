class AlterPublisherAds2 < ActiveRecord::Migration
  def change

      add_column :publisher_ads, :ad_amount, :decimal, precision: 8, scale: 2, :default => 0.00

  end
end
