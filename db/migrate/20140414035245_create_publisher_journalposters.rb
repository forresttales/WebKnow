class CreatePublisherJournalposters < ActiveRecord::Migration
  def change
    create_table :publisher_journalposters do |t|

      t.integer "publisher_id"
      t.string "name_journalposter", :limit => 255
      t.boolean "has_description", :default => false
      t.string "product_logo", :limit => 255
      t.boolean "has_product_logo", :default => false
      t.string "product_metadata", :limit => 255
      t.boolean "has_product_metadata", :default => false

      t.timestamps
    end
  end
end
