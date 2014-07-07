class CreatePublisherAds < ActiveRecord::Migration
  def change
    create_table :publisher_ads do |t|
      t.integer "user_id"
      t.integer "publisher_id"
      t.string "ad_name"
      t.string "ad_subject"

      t.timestamps
    end
      add_index("publisher_ads", "publisher_id")
  end
end
