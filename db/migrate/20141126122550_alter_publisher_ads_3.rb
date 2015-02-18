class AlterPublisherAds3 < ActiveRecord::Migration
  def change
    
      add_column :publisher_ads, :ad_status_public_index, :integer, :default => 0
      add_column :publisher_ads, :ad_status_public_msg, :string
      add_column :publisher_ads, :auth_code, :string
    
      # add_index("publisher_ads", "publisher_id")
    
  end
end

# ad_status_public_index  int
# ad_status_public_msg    string
# auth_code               string