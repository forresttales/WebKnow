class CreatePublisherJournalposterMetadatatags < ActiveRecord::Migration
  def change
    create_table :publisher_journalposter_metadatatags do |t|

      t.integer "publisher_id"
      t.integer "publisher_journalposter_id"
      t.string "name_metadata", :limit => 255
      t.text "text_metadata"

      t.timestamps
    end
  end
end

#  publisher_id         :integer
#  publisher_product_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#  name_metadata        :string(100)
#  text_metadata        :text
