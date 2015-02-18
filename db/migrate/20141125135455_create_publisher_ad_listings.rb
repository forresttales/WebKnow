class CreatePublisherAdListings < ActiveRecord::Migration
  def change
    create_table :publisher_ad_listings do |t|

      t.timestamps
    end
  end
end
