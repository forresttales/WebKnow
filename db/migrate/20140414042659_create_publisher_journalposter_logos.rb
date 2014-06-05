class CreatePublisherJournalposterLogos < ActiveRecord::Migration
  def change
    create_table :publisher_journalposter_logos do |t|

      t.integer "publisher_id"
      t.integer "publisher_journalposter_id"
      t.string "image", :limit => 255

      t.timestamps
    end
  end
end
